//
//  ListPresenter.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol IListPresenter {
    func fetchItems()
    func presentList(with items: [Model]?)
    func message(text: String?)
}

final class ListItemPresenter: IListPresenter, ListDataSource {

    weak var controller: ListDisplayLogic?
    var network: NetworkWorker?
    var urlComposer: WorkerURLPathBuilder?
    var response: ListResponse?
    
    func fetchItems() {
        guard let urlPath = urlComposer?.makeMainListUrl() else {
            return
        }
        let params = ApiParams(urlPath: urlPath, method: .get, params: nil)
        network?.request(with: params, resultType: ListResponse.self, handler: { [weak self] response in
            switch response {
            case .success(let items):
                self?.response = items
            case .failure(let error):
                self?.controller?.display(message: error.message)
            }
        })
    }
    
    func presentList(with items: [Model]?) {
        
        controller?.display(viewModel: parseToListItemModelVisible(from: items))
    }
    
    func parseToListItemModelVisible(from items: [Model]?) -> [Model]? {
        
        guard var items = items as? [Visible] else {
            return nil
        }
        for index in items.indices {
//            items[index].layoutView = .cardListItemView
        }
        return items
    }
    
    func message(text: String?) {
        controller?.display(message: text)
    }
    
    // MARK: -
    
    func numberOfSections() -> Int {
        .zero
    }
    
    func numberOfRow(at section: Int) -> Int {
        .zero
    }
    
    func getModel(at indexPath: IndexPath) -> Model? {
        nil
    }
}
