//
//  ListRouter.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol ListRoutable {
    func goToDetail(with data: Model?)
}

final class ListItemRouter: NSObject, ListRoutable {
    
    weak var controller: UIViewController?
    
    var navigationController: UINavigationController? {
        return controller?.navigationController
    }
    
    func goToDetail(with data: Model?) {
        if let controller = DetailItemSceneFactory.makeScene(with: data) {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
