//
//  ListController.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol DetailDisplay: AnyObject where Self: UIViewController {
    func dismiss()
    func reloadView()
    func display(message: String?)
}

final class DetailItemController: UIViewController,
                                  DetailDisplay,
                                  LoadingManagers,
                                  AlertPresetable {

    var presenter: DetailPresentable?
    var listView: ListEvent?
    var item: Model?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorAssets.titleColor
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadView()
    }
    
    func dismiss() {
        navigationController?.dismiss(animated: true)
    }
    
    func reloadView() {
        listView?.reloadView()
    }
    
    func display(message: String?) {
        stopLoading { [weak self] in
            self?.presentAlert(with: nil, and: message) {[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
}
