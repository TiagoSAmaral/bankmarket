//
//  ListItemSceneFactory.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

enum ListItemSceneFactory {
    
    static func makeScene(with data: Model?) -> UIViewController? {
        let controller = ListItemController()
        let presenter = ListItemPresenter()
        let router = ListItemRouter()
        let interactor = ListItemInteractor()
        let view = ListItemView()
        
        let workerNetwork = NetworkConactable()
        let workerSecurity = Security()
        workerSecurity.workerNetwork = NetworkConactable()
        workerSecurity.workerUrlBuilder = URLPathBuilder()
        workerSecurity.keyAdvisor = KeysAcessor()
        let workerApiPathBuilder = URLPathBuilder()
        
        presenter.controller = controller
        router.controller = controller
        
        interactor.presenter = presenter
        interactor.workerNetwork = workerNetwork
        interactor.workerSecurity = workerSecurity
        interactor.workerApiPathBuilder = workerApiPathBuilder
        
        controller.interactor = interactor
        controller.router = router
        controller.view = view
        
        return controller
    }
}
