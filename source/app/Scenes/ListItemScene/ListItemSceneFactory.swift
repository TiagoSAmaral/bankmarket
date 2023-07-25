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
        let listView = ListContructor().createVerticalList(with: presenter)

        listView.cardFactory = CardConstructor()
        viewMosaic.insertNew(view: listView)

        presenter.urlComposer = URLPathBuilder()
        presenter.network = NetworkConactable()

        presenter.controller = controller
        presenter.router = router
        router.controller = controller

        controller.presenter = presenter
        controller.listView = listView
        controller.view = viewMosaic.baseView

        return controller
    }
}
