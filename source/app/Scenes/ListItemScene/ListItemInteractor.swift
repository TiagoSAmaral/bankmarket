//
//  ListInteractor.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemInteractorBusinessLogic {
    func fetchItems()
    func fetchNextPage()
    func flushAndRequest()
}

final class ListItemInteractor: ListItemInteractorBusinessLogic {
    
    var presenter: ListItemPresentationLogic?
    var workerNetwork: NetworkWorker?
    var workerApiPathBuilder: WorkerURLPathBuilder?
    var currentLocale: String = LocalizedText.with(tagName: .localizationApi)
    var metadata: Metadata?
    
    var lastResponse: ResponseList?
    var items: [Item]?
    
    func fetchItems() {
    }
    
    func fetchNextPage() {

    }
    
    func requestItems(with token: String?, page: Int?) {
        
    }
    
    func nextPage() -> Int? {
        
        guard let lastResponse = lastResponse,
              let lastPage = lastResponse.page,
              let pageCount = lastResponse.pageCount else {
            return 1
        }
        
        let nextPageNumber = lastPage + 1
        return pageCount >= nextPageNumber ? nextPageNumber: nil
    }
    
    func flushAndRequest() {
        lastResponse = nil
        items = nil
        fetchItems()
    }
}
