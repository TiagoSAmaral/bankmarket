//
//  ListPresenter.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListPresentable {
    func fetchItems()
}

final class ListItemPresenter: ListPresentable, ListDataSource, ActionProvider {
    
    weak var controller: ListDisplayLogic?
    var network: NetworkWorker?
    var urlComposer: WorkerURLPathBuilder?
    var response: [ListItemViewModelVisible]?
    var router: ListRoutable?
    var listItemAdapter: ListItemLayoutAdaptable?
    
    lazy var actionTap: ((Model?) -> Void)? = { [weak self] item in
        self?.router?.goToDetail(with: item)
    }
    
    func fetchItems() {
        guard let urlPath = urlComposer?.makeMainListUrl(), response == nil else {
            return
        }
        let params = ApiParams(urlPath: urlPath, method: .get, params: nil)
        network?.request(with: params, resultType: ListResponse.self, handler: { [weak self] response in
            switch response {
            case .success(let items):
                DispatchQueue.main.async { [weak self] in
                    self?.response = self?.listItemAdapter?.mapByPropertySetViewLayout(item: items, with: self)
                    self?.controller?.reload()
                    print("Finish")
                }
            case .failure(let error):
                self?.controller?.display(message: error.message)
            }
        })
    }

    // MARK: - ListDataSource
    func numberOfSections() -> Int {
        response?.count ?? .zero
    }
    
    func numberOfRow(at section: Int) -> Int {
        response?.count ?? .zero
    }
    
    func getModel(at indexPath: IndexPath) -> Model? {
        guard var item = response?[indexPath.row] else {
            return nil
        }
        return item
    }
}
