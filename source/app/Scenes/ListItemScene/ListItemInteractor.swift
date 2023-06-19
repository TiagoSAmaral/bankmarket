//
//  ListInteractor.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemInteractorBusinessLogic {
    
    func fetchItems()
}

final class ListItemInteractor: ListItemInteractorBusinessLogic {
    
    var presenter: ListItemPresentationLogic?
    var workerNetwork: NetworkWorker?
    var workerSecurity: SecurityWorker?
    var workerApiPathBuilder: WorkerURLPathBuilder?
    var currentLocale: String = "pt_BR"
    
    var lastResponse: ResponseList?
    
    func fetchItems() {
        
        let requestGroup =  DispatchGroup()
        var authToken: String?
        
        requestGroup.enter()
        
        workerSecurity?.getUserToken(handler: { [weak self] result in
            switch result {
            case .success(let token):
                if let token = token {
                    authToken = token
                } else {
                    self?.presenter?.message(string: "Não foi possível realizar a requisição.")
                }
                requestGroup.leave()
            case .failure(let error):
                self?.presenter?.message(string: error.message)
                requestGroup.leave()
            }
        })
        
        requestGroup.notify(queue: DispatchQueue.main) { [weak self] in
            if let authToken = authToken {
                self?.requestItems(with: authToken, page: self?.nextPage())
            } else {
                self?.presenter?.message(string: "Não foi possível realizar a requisição.")
            }
        }
    }
    
    func requestItems(with token: String?, page: Int?) {
        
        if let urlPath = workerApiPathBuilder?.makeUrlCards(with: nextPage(), locale: currentLocale), let token = token {

            let apiParams = ApiParams(urlPath: urlPath, token: token, method: .get, params: nil)
            
            workerNetwork?.request(with: apiParams, resultType: ResponseList.self, handler: { [weak self] response in
                switch response {
                case .success(let responseList):
                    self?.lastResponse = responseList
                    self?.presenter?.presentList(with: responseList.cards)
                case .failure(let error):
                    self?.presenter?.message(string: error.message)
                }
            })
        }
    }
    
    func nextPage() -> Int {
        guard let lastResponse = lastResponse,
              let lastPage = lastResponse.page else {
            return 1
        }
        return lastPage + 1
    }
}
