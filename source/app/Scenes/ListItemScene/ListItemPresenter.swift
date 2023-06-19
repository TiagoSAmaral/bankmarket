//
//  ListPresenter.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemPresentationLogic {
    func presentList(with items: [Item]?)
    func message(string: String?)
}

final class ListItemPresenter: ListItemPresentationLogic {
    
    weak var controller: ListDisplayLogic?
    
    func presentList(with items: [Item]?) {
        
        // Make a viewModel here. Use Adapter.
        // Parse Item to ListItemModelVisible model.
        controller?.display(viewModel: parseToListItemModelVisible(from: items))
    }
    
    func parseToListItemModelVisible(from items: [Item]?) -> [ListItemModelVisible] {
        
        var visibleItems = [ListItemModelVisible]()
        
        items?.forEach({ item in
            let visibleitem = ListItemViewModel()
            visibleitem.title = item.name
            visibleitem.layoutView = .cardListItemView
            visibleitem.imageUrlPath = item.cropImage
            visibleitem.flavorDescription = item.flavorText
            visibleItems.append(visibleitem)
        })
        
        return visibleItems
    }
    
    func message(string: String?) {
        
    }
}
