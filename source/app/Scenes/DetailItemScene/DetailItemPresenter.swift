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
    var items: [Model]?
    
    func fetchItem() {}
    
    func presentItem(with item: Model?) {
        guard let item = item else {
//            controller?.dismiss(animated: true)
            return
        }
        items = [item]
        controller?.reloadView()
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
