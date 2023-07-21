//
//  Item.swift
//
//  Created by Tiago Amaral on 16/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

struct Item: Decodable, Visible, Selectable, CardListItemViewModel, CardDetailItemViewModel {

    let identifier: Int?
    let slug: String?
    let image: String?
    let cropImage: String?
    let name: String?
    let flavorText: String?
    let text: String?
    let cardSetId: Int?
    let cardTypeId: Int?
    let rarityId: Int?
    let attack: Int?
    let manaCost: Int?
    let health: Int?

    var cardSet: MetadataItem?
    var cardType: MetadataItem?
    var rarity: MetadataItem?
        
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        
        case slug,
        image,
        cropImage,
        name,
        flavorText,
        text,
        cardSetId,
        cardTypeId,
        rarityId,
        attack,
        manaCost,
        health
    }
    
    // MARK: - Visible
    var layoutView: CardLayoutView?
    
    // MARK: - Selectable
    var actionOnTap: ((Model?) -> Void)?

    // MARK: - CardListItemViewModel
    var cardTitle: String? {
        name
    }
    var cardDescriptionText: String? {
        flavorText
    }
    var cardCropImageUrl: String? {
        cropImage
    }
    
    // MARK: - CardDetailItemViewModel
    
    var cardImageUrl: String? {
        image
    }
    var cardFullText: String? {
        text
    }
    var cardCardSetText: String? {
        cardSet?.name
    }
    var cardRarityText: String? {
        rarity?.name
    }
    var cardAttackNumber: Int? {
        attack
    }
    var cardManaCostNumber: Int? {
        manaCost
    }
    var cardHealthNumber: Int? {
        health
    }
    var cardFlavorText: String? {
        flavorText
    }
}
