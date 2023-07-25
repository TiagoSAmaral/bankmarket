//
//  ListCollectionFactory.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

struct ListContructor {
    
    func createHorizontalList(with dataSource: ListDataSource?) -> ListView {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 8.0
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)

        return makeCollection(with: dataSource, config: flow)
    }
    
    func createVerticalList(with dataSource: ListDataSource?) -> ListView {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 8.0
        flow.scrollDirection = .vertical
        flow.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)

        return makeCollection(with: dataSource, config: flow)
    }
    
    func makeCollection(with delegate: ListDataSource?, config: UICollectionViewFlowLayout) -> ListView {
        let list = CollectionList(frame: .zero, collectionViewLayout: config)
        list.disablePaginateCenter()
        list.listDataSource = delegate
        list.backgroundColor = .white
        list.showsHorizontalScrollIndicator = false
        return list
    }
}
