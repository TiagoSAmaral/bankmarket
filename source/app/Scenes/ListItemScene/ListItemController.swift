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
    func display(message: String?)
}

final class ListItemController: UIViewController, ListDisplayLogic, ControllerDelegate {
    
    var interactor: ListItemInteractorBusinessLogic?
    var router: ListItemRoutingLogic?
    var listView: TableViewUpdateEvent?
    var items: [Model]?
    
    func display(viewModel: [ListItemModelVisible]) {
        items = viewModel
        listView?.reloadView()
    }
    
    func display(message: String?) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        interactor?.fetchItems()
        (navigationController as? NavigationControllerDecorable)?.defineNavigationBarTitleViewWith(imageName: "navigationBarLogo")
    }
    
    lazy var goToDetail: ((Model?) -> Void)? = { [weak self] item in
        if let item = item {
            self?.router?.goToDetail(with: item)
        }
    }
    
//  MARK: ControllerDelegate Methods
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRow(at section: Int) -> Int {
        items?.count ?? .zero
    }
    
    func pullToRefreshEvent() {
        interactor?.fetchItems()
    }
    
    func nextPageEvent() {
        interactor?.fetchNextPage()
    }
    
    func getModel(at indexPath: IndexPath) -> Model?  {
        guard var item = items?[indexPath.row] as? Selectable else {
            return nil
        }
        item.actionOnTap = goToDetail
        
        return item
    }
}
