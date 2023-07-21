//
//  ListPresenter.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

protocol DetailItemPresentationLogic {
    func presentItem(with item: Model?)
    func message(text: String?)
}

final class DetailItemPresenter: DetailItemPresentationLogic {
    
    weak var controller: DetailDisplayLogic?
    
    func presentItem(with item: Model?) {
        guard var item = item as? Visible else {
            controller?.display(message: LocalizedText.with(tagName: .networkErrorNotDefined))
            return
        }
        item.layoutView = .cardDetailItemView
        controller?.display(viewModel: item)
    }

    func message(text: String?) {
        controller?.display(message: text)
    }
}
