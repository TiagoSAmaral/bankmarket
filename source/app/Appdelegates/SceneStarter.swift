//
//  ScenesStart.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

final class SceneStarter {
    
    static func makeScene(into window: UIWindow?) {
        
        guard let window = window else {
            fatalError("File: \(#file) \n \(#function) \n Error Description: Is not possible render scenes. Need a UIWindow valid instance.")
        }
        
        guard let controller = ListItemSceneFactory.makeScene(with: nil) else {
            fatalError("File: \(#file) \n \(#function) \n Error Description: Is not possible render scenes. Need a UIViewController valid instance.")
        }
        
        let rootController = makeNavigation()
        rootController.viewControllers = [controller]
        window.makeKeyAndVisible()
    }
    
    static func makeNavigation() -> UINavigationController {
        NavigationController()
    }
}
