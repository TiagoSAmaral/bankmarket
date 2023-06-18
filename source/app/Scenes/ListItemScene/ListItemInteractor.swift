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
    var worker: NetworkWorker?
    
    var lastResponse: ResponseList?
    
    func fetchItems() {
    
        worker?.request(with: ApiParams(page: nextPage()), resultType: ResponseList.self) { [weak self] response in
            
            switch response {
            case .success(let data):
                self?.lastResponse = data
                self?.presenter?.presentList(with: data.cards)
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func nextPage() -> Int {
        guard let lastResponse = lastResponse,
              let lastPage = lastResponse.page else {
            return .zero
        }
        return lastPage + 1
    }
}
