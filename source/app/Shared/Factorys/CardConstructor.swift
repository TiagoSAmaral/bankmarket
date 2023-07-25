//
//  CardFactory.swift
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

final class InnerDataSource: ListDataSource {
    
    var items: [Model]?
    
    func numberOfSections() -> Int {
        items != nil ? 1: .zero
    }

    func numberOfRow(at section: Int) -> Int {
        items?.count ?? .zero
    }

    func getModel(at indexPath: IndexPath) -> Model? {
        items?[indexPath.row]
    }
}

final class CardConstructor: CardFactory {

    func makeCard(from item: Model?, orWith models: [Model]?) -> CardVisible? {
        guard let item = item as? Visible else {
            return nil
        }
        
        switch item.layoutView {
        case .bannerScrollableView, .cashDigioScrollableView, .productScrollableView:
            let card = CardScrollerView()
            card.listConstructor = ListContructor()
            let dataSource = InnerDataSource()
            dataSource.items = models
            card.load(listDataSource: dataSource, cardFactory: self)
            return card
        
        case .bannerCardView, .cashDigioCardView:
            return CardConstructor.make(with: item, classType: CardFullImageView.self)
            
        case .productCardView:
            return CardConstructor.make(with: item, classType: CardCenterImageView.self)

        case .titleCardView:
            return CardConstructor.make(with: item, classType: CardTitleView.self)

        default:
            return nil
        }
    }
    
    static func make<T: CardStaticVisible>(with data: Model, classType: T.Type) -> T {
        let cardView = T.init()
        cardView.load(model: data)
        return cardView
    }
}
