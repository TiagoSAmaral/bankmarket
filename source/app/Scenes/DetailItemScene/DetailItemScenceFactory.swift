//
//  ListItemSceneFactory.swift
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

enum DetailItemSceneFactory {
    
    static func makeScene(with data: Model?) -> UIViewController? {
        let controller = DetailItemController()
        let presenter = DetailItemPresenter()
        let viewMosaic = MosaicBaseView()
        let listView = ListContructor().createVerticalList(with: presenter) // TableViewAutomaticPaginate(controller: controller)
        
        listView.cardFactory = CardConstructor()
        viewMosaic.insertNew(view: listView)
        
        let workerNetwork = NetworkConactable()
        let workerApiPathBuilder = URLPathBuilder()
        
        presenter.controller = controller

        controller.listView = listView
        controller.view = viewMosaic.baseView
        
        return controller
    }
}
