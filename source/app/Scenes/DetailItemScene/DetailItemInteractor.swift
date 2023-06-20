//
//  ListInteractor.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol DetailItemInteractorBusinessLogic {
    func fetchItem()
}

final class DetailItemInteractor: DetailItemInteractorBusinessLogic {
    
    var workerNetwork: NetworkWorker?
    var workerSecurity: SecurityWorker?
    var workerApiPathBuilder: WorkerURLPathBuilder?
    var currentLocale: String = "pt_BR"
    var selectedItem: Model?
    var presenter: DetailItemPresentationLogic?
    
    func fetchItem() {
        
        let requestGroup =  DispatchGroup()
        var authToken: String?
        
        requestGroup.enter()
        
        workerSecurity?.getUserToken(handler: { [weak self] result in
            switch result {
            case .success(let token):
                authToken = token
            case .failure(let error):
                self?.presenter?.message(string: error.message)
            }
            
            requestGroup.leave()
        })
        
        requestGroup.notify(queue: DispatchQueue.main) { [weak self] in
            self?.requestMetadata(with: authToken)
        }
        
//        presenter?.presentItem(with: selectedItem)
    }
    
    func requestMetadata(with token: String?) {
        
        guard let token = token else {
            presenter?.message(string: "")
            return
        }
        
        guard let urlPath = workerApiPathBuilder?.makeUrlMetadata(with: "pt_BR") else {
            presenter?.message(string: "")
            return
        }
        
        let apiParams = ApiParams(urlPath: urlPath, token: token, method: .get, params: nil)
        workerNetwork?.request(with: apiParams, resultType: Metadata.self, handler: { result in
            
        })
    }
}
