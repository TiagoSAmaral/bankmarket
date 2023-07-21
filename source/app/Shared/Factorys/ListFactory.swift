//
//  ListCollectionFactory.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

enum ListCollectionFactory {
    
    static func createHorizontalBanner(with dataSource: ListDataSource) -> ListView {
        let flow = UICollectionViewFlowLayout()
        let heightCard: CGFloat = 160.0
//        (delegate as? ListCollectionCardHeight)?.setHeight(value: heightCard)
        flow.itemSize = CGSize(width: 340.0, height: heightCard)
        flow.minimumLineSpacing = 8.0
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
        
        return makeCollection(with: dataSource, config: flow)
    }
    
    static func createHorizontalProductList(with dataSource: ListDataSource) -> ListView {
        let flow = UICollectionViewFlowLayout()
        let heightCard: CGFloat = 100.0
//        (delegate as? ListCollectionCardHeight)?.setHeight(value: heightCard)
        flow.itemSize = CGSize(width: 80.0, height: heightCard)
        flow.minimumLineSpacing = 8.0
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)

        return makeCollection(with: dataSource, config: flow)
    }
    
    static func createVerticalList(with dataSource: ListDataSource) -> ListView {
        let flow = UICollectionViewFlowLayout()
        let heightCard: CGFloat = 160.0
//        (delegate as? ListCollectionCardHeight)?.setHeight(value: heightCard)
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width, height: heightCard)
        flow.minimumLineSpacing = 8.0
        flow.scrollDirection = .vertical
        flow.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)

        return makeCollection(with: dataSource, config: flow)
    }
    
    static func makeCollection(with delegate: ListDataSource, config: UICollectionViewFlowLayout) -> ListView {
        let list = CollectionList(frame: .zero, collectionViewLayout: config)
        list.disablePaginateCenter()
        list.listDataSource = delegate
        list.backgroundColor = .white
        list.showsHorizontalScrollIndicator = false
        return list
    }
}
