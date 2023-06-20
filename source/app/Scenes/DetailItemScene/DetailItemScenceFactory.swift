//
//  ListItemSceneFactory.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

enum DetailItemSceneFactory {
    
    static func makeScene(with data: Model?) -> UIViewController? {
        let controller = DetailItemController()
        let presenter = DetailItemPresenter()
        let interactor = DetailItemInteractor()
        let viewMosaic = MosaicBaseView()
        let listTableView = TableViewAutomaticPaginate(controller: controller)
        interactor.selectedItem = data
        
        listTableView.cardFactory = CardConstructor()
        viewMosaic.insertNew(view: listTableView)
        
        let workerNetwork = NetworkConactable()
        let workerSecurity = Security()
        workerSecurity.workerNetwork = NetworkConactable()
        workerSecurity.workerUrlBuilder = URLPathBuilder()
        workerSecurity.keyAdvisor = KeysAcessor()
        
        let workerApiPathBuilder = URLPathBuilder()
        
        presenter.controller = controller
        
        interactor.presenter = presenter
        interactor.workerNetwork = workerNetwork
        interactor.workerSecurity = workerSecurity
        interactor.workerApiPathBuilder = workerApiPathBuilder
        
        controller.interactor = interactor
        controller.listView = listTableView
        controller.view = viewMosaic.baseView
        
        return controller
    }
}
