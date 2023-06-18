//
//  ListController.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol ListDisplayLogic: AnyObject where Self: UIViewController {
    func display(viewModel: [ListItemModelVisible])
}

final class ListItemController: UIViewController, ListDisplayLogic {
    
    var interactor: ListItemInteractorBusinessLogic?
    var router: ListItemRoutingLogic?
    
    func display(viewModel: [ListItemModelVisible]) {}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        interactor?.fetchItems()
    }
}
