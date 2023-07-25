//
//  ListController.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol ListDisplayLogic: AnyObject where Self: UIViewController {
    func display(message: String?)
    func startLoading()
    func stopLoading(onFinish: (() -> Void)?)
    func reload()
}

final class ListItemController: UIViewController,
                                ListDisplayLogic,
                                LoadingManagers,
                                AlertPresetable {
    
    var presenter: ListPresentable?
    var listView: ListView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.fetchItems()
    }

    func reload() {
        listView?.reloadView()
    }
    
    func display(message: String?) {
        stopLoading { [weak self] in
            self?.presentAlert(with: nil, and: message, handler: nil)
        }
    }
}
