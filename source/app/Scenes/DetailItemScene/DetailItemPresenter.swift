//
//  ListPresenter.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol DetailPresentable {
    func presentItem(with item: Model?)
    func message(text: String?)
}

final class DetailItemPresenter: DetailPresentable, ListDataSource {
    
    weak var controller: DetailDisplay?
    var detailItemAdapter: DetailItemAdaptable?
    var items: [Model]?
    
    func presentItem(with item: Model?) {
        guard let item = item else {
            return
        }
        items = detailItemAdapter?.mapByPropertySetViewLayout(item: item)  // [item]
    }

    func message(text: String?) {
        controller?.display(message: text)
    }
    
    // MARK: -
    func numberOfSections() -> Int {
        items != nil ? 1: .zero
    }
    
    func numberOfRow(at section: Int) -> Int {
        items?.count ?? .zero
    }
    
    func getModel(at indexPath: IndexPath) -> Model? {
        guard let item = items?[indexPath.row] else {
            return nil
        }
        
        return item
    }
}
