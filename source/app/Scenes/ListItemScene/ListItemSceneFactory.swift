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
        let viewMosaic = MosaicBaseView()
        let listTableView = ListCollectionFactory.createVerticalList(with: presenter) // TableViewAutomaticPaginate(controller: controller,
                               //                        isPullToRefreshEnable: true)
        listTableView.cardFactory = CardConstructor()
        viewMosaic.insertNew(view: listTableView)
        
        presenter.urlComposer = URLPathBuilder()
        presenter.network = NetworkConactable()
        presenter.controller = controller
        router.controller = controller

        controller.presenter = presenter
        controller.router = router
        controller.listView = listTableView
        controller.view = viewMosaic.baseView
        
        return controller
    }
}
