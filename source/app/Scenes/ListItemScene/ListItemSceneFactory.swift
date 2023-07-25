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
        let profileViewer = ProfileView()
                
        let fakeProfileViewModel = ProfileFake.makeFake()
        profileViewer.load(model: fakeProfileViewModel)
        listView.cardFactory = CardConstructor()
        
        viewMosaic.insertNew(view: profileViewer)
        viewMosaic.insertNew(view: listView)

        presenter.urlComposer = URLPathBuilder()
        presenter.network = NetworkConactable()
        presenter.listItemAdapter = ListItemLayoutAdapter()

        presenter.controller = controller
        presenter.router = router
        router.controller = controller

        controller.presenter = presenter
        controller.listView = listView
        controller.view = viewMosaic.baseView

        return controller
    }
}

struct ProfileFake: Model, ProfileViewModel {
    var titleValue: String?
    var profileImage: String?
    
    static func makeFake() -> ProfileFake {
        ProfileFake(titleValue: "Tiago Amaral", profileImage: "https://media.licdn.com/dms/image/C4D03AQEAEDnu83wgQA/profile-displayphoto-shrink_200_200/0/1625150055190?e=1695859200&v=beta&t=eze0cXqLYMyzcd5XfmYdOsl2Py86jhRBv0_GA2Zr3Sg")
    }
}
