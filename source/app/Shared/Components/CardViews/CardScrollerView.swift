//
//  CardScrollerView.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 24/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

final class CardScrollerView: UIView, CardScrollableVisible {

    var listView: ListView?
    var listConstructor: ListContructor?
    var listDataSource: ListDataSource?

    func load(listDataSource: ListDataSource?, cardFactory: CardFactory) {
        self.listDataSource = listDataSource
        listView = listConstructor?.createHorizontalList(with: listDataSource)
        listView?.cardFactory = cardFactory
        makeLayout()
        
        listView?.activePaginateCenter()
        listView?.reloadView()
    }

    func makeLayout() {
        guard let listView = listView else {
            return
        }
        addSubviews([listView])
        listView.edgeToSuperView()
    }
}
