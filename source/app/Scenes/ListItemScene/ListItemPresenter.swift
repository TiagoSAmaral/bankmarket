//
//  ListPresenter.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemPresentationLogic {
    func presentList(with items: [Model]?)
    func message(string: String?)
}

final class ListItemPresenter: ListItemPresentationLogic {

    weak var controller: ListDisplayLogic?
    
    func presentList(with items: [Model]?) {
        
        controller?.display(viewModel: parseToListItemModelVisible(from: items))
    }
    
    func parseToListItemModelVisible(from items: [Model]?) -> [Model]? {
        
        guard var items = items as? [Visible] else {
            return nil
        }
        for index in items.indices {
            items[index].layoutView = .cardListItemView
        }
        return items
    }
    
    func message(string: String?) {
        
    }
}
