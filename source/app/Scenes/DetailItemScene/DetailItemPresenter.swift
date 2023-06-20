//
//  ListPresenter.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol DetailItemPresentationLogic {
    func presentItem(with item: Model?)
    func message(string: String?)
}

final class DetailItemPresenter: DetailItemPresentationLogic {
    
    weak var controller: DetailDisplayLogic?
    
    func presentItem(with item: Model?) {
        guard var item = item as? Visible else {
            controller?.display(message: "")
            return
        }
        item.layoutView = .cardDetailItemView
        controller?.display(viewModel: item)
    }

    func message(string: String?) {}
}
