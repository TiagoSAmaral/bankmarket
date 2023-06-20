//
//  AlertView.swift
//  hearthstonecardviewer
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

struct AlertViewFactory {
    
    static func makeAlert(with title: String?, and message: String?, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
     
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Fechar", style: .default, handler: handler))
        return controller
    }
}
