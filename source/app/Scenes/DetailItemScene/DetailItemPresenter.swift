//
//  ListPresenter.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol IDetailItemPresentation {
    func fetchItem()
    func presentItem(with item: Model?)
    func message(text: String?)
}

final class DetailItemPresenter: IDetailItemPresentation, ListDataSource {
    
    weak var controller: DetailDisplayLogic?
    
    func fetchItem() {}
    
    func presentItem(with item: Model?) {
        guard var item = item as? Visible else {
            controller?.display(message: LocalizedText.with(tagName: .networkErrorNotDefined))
            return
        }
//        item.layoutView = .cardDetailItemView
        controller?.display(viewModel: item)
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
