//
//  CardFactory.swift
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

final class CardConstructor: CardFactory {
    
    func makeCard(from item: Visible?) -> CardVisible? {
        guard let item = item else {
            return nil
        }
        
        switch item.layoutView {
//        case .cardListItemView:
//            return CardConstructor.make(with: item, classType: CardListItemView.self)
//        case .cardDetailItemView:
//            return CardConstructor.make(with: item, classType: CardDetailItemView.self)
        default:
            return nil
        }
    }
    
    static func make<T: CardVisible>(with data: Model, classType: T.Type) -> T {
        let cardView = T.init()
        cardView.load(model: data)
        return cardView
    }
}
