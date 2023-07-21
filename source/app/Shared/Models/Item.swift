//
//  Item.swift
//
//  Created by Tiago Amaral on 16/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

//, Visible, Selectable, CardListItemViewModel, CardDetailItemViewModel
struct Item: Decodable, Visible, Selectable {

    let title: String?
    let bannerURL: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case title, bannerURL, description
    }
    
    // MARK: Visible
    var layoutView: CardLayoutView?
    
    // MARK: Selectable
    var actionOnTap: ((Model?) -> Void)?
}

struct ListResponse: Decodable, Model {
    
    let spotlight: [Item]?
    let products: [Item]?
    let cash: Item?
}
