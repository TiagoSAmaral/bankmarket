//
//  Security.swift
//  HeartOfStoneViewerTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol SecurityWorker {
    
    func getUserToken(handler: ((Result<String?, NetworkError>) -> Void)?)
    func deleteToken()
}

final class Security: SecurityWorker {

    var workerNetwork: NetworkWorker?
    var keyAdvisor: KeyAdvisor?
    var workerUrlBuilder: WorkerURLPathBuilder?
    
    private let clientIdKey: String = "client_id"
    private let clientSecretKey: String = "client_secret"
    private let clientCredentialsKey: String = "grant_type"
    private let keyTokenAccess: String = "keyTokenAccess"
    
    func getUserToken(handler: ((Result<String?, NetworkError>) -> Void)?) {
        
        if let accessToken = requestLocalToken() {
            handler?(.success(accessToken))
            return
        }
        
        guard let keyAdvisor = keyAdvisor else {
            handler?(.failure(NetworkError.makeError(with: 400, description: "KeyAdvisor not implemented.")))
            return
        }
        
        guard let urlPath = workerUrlBuilder?.makeUrlAuthorization() else {
            handler?(.failure(NetworkError.makeError(with: 400, description: "Url to authorization not found.")))
            return
        }
       
        let apiSecurityInfo: [[String: String]] = [
            [clientIdKey: keyAdvisor.publicKeyApi],
            [clientSecretKey: keyAdvisor.privateKeyApi],
            [clientCredentialsKey: "client_credentials"],
        ]
        
        let apiParams = ApiParams(urlPath: urlPath,
                                  token: .empty,
                                  method: .get,
                                  params: apiSecurityInfo)
        
        requestAuthorizationToken(apiParams: apiParams, handler: handler)
    }
    
    func requestAuthorizationToken(apiParams: ApiParams, handler: ((Result<String?, NetworkError>) -> Void)?) {
        
        workerNetwork?.requestMultipart(with: apiParams, resultType: ResponseAuthorizationBearer.self) { response in
            
            switch response {
            case .success(let result):
                
                guard let accessToken = result.accessToken else {
                    handler?(.failure(NetworkError.makeError(with: 400, description: "Url to authorization not found.")))
                    return
                }
                
                do {
                    try KeychainAccess.addNew(secretWord: accessToken, keyValue: self.keyTokenAccess)
                    handler?(.success(accessToken))
                } catch (let error) {
                    handler?(.failure(NetworkError.badRequest(text: error.localizedDescription)))
                }
            case .failure(let error):
                handler?(.failure(error))
            }
        }
    }
    
    func requestLocalToken() -> String? {
        try? KeychainAccess.take(keyValue: self.keyTokenAccess)
    }
    
    func deleteToken() {
        try? KeychainAccess.remove(keyValue: self.keyTokenAccess)
    }
}
