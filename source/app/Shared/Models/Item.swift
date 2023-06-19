//
//  HSCard.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 16/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

struct Item: Decodable {
    let id: Int?
    let slug: String?

    let image: String?
    let cropImage: String?
    let name: String?
    let flavorText: String?
    let text: String?   // property text conatins HTML tags. Must be handled with NSAttributedString
    let cardSetId: Int? // set pertencente
    let cardTypeId: Int? // type
                         // Como associar a facção
    let rarityId: Int?
    let attack: Int?
    let manaCost: Int?
    let health: Int?

    var cardSet: MetadataItem?
    var cardType: MetadataItem?
    var rarity: MetadataItem?
}
