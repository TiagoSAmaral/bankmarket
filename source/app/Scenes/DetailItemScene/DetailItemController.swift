//
//  ListController.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: AnyObject where Self: UIViewController {
    func display(viewModel: Model?)
    func display(message: String?)
}

final class DetailItemController: UIViewController,
                                  DetailDisplayLogic,
                                  TableViewAutomaticPaginateDelegate,
                                  LoadingManagers,
                                  AlertPresetable {

    var interactor: DetailItemInteractorBusinessLogic?
    var listView: TableViewUpdateEvent?
    var item: Model?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchItem()
    }
    
    func fetchItem() {
        if item == nil {
            startLoading()
            interactor?.fetchItem()
        }
    }
    
    func display(viewModel: Model?) {
        stopLoading(onFinish: nil)
        item = viewModel
        listView?.reloadView()
    }
    
    func display(message: String?) {
        stopLoading { [weak self] in
            self?.presentAlert(with: nil, and: message) {[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    // MARK: - TableViewAutomaticPaginateDelegate methods
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRow(at section: Int) -> Int {
        item == nil ? .zero: 1
    }
    
    func getModel(at indexPath: IndexPath) -> Model? {
        item
    }
}
