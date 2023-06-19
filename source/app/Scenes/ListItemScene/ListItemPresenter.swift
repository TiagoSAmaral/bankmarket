//
//  ListPresenter.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemPresentationLogic {
    func presentList(with response: [Item]?)
    func message(string: String?)
}

final class ListItemPresenter: ListItemPresentationLogic {
    
    weak var controller: ListDisplayLogic?
    
    func presentList(with response: [Item]?) {
        
        // Make a viewModel here. Use Adapter.
        // Parse Item to ListItemModelVisible model.
        controller?.display(viewModel: [ListItemModelVisible]())
    }
    
    func message(string: String?) {
        
    }
}
