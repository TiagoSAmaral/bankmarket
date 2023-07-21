//
//  ListItemSceneFactory.swift
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
        let viewMosaic = MosaicBaseView()
        let listTableView = TableViewAutomaticPaginate(controller: controller,
                                                       isPullToRefreshEnable: true,
                                                       isPaginateEnable: true)
        listTableView.cardFactory = CardConstructor()
        viewMosaic.insertNew(view: listTableView)
        let workerNetwork = NetworkConactable()
        let workerApiPathBuilder = URLPathBuilder()
        
        presenter.controller = controller
        router.controller = controller
        
        interactor.presenter = presenter
        interactor.workerNetwork = workerNetwork
        interactor.workerApiPathBuilder = workerApiPathBuilder
        
        controller.interactor = interactor
        controller.router = router
        controller.listView = listTableView
        controller.view = viewMosaic.baseView
        
        return controller
    }
}
