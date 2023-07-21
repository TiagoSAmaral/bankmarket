//
//  AlertPresentable.swift
//  bankmarket
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol AlertPresetable where Self: UIViewController {
    
    func presentAlert(with title: String?, and message: String?, handler: ((UIAlertAction) -> Void)?)
}

extension AlertPresetable {
    func presentAlert(with title: String?, and message: String?, handler: ((UIAlertAction) -> Void)?) {
        present(AlertViewFactory.makeAlert(with: title, and: message, handler: handler), animated: true)
    }
}
