//
//  Item.swift
//
//  Created by Tiago Amaral on 16/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

struct Item: Decodable, Visible, Selectable, ListItemViewModelMap {

    var title: String?
    var bannerURL: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case title, bannerURL, description, imageURL
    }
    
    init() {
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.bannerURL = try container.decodeIfPresent(String.self, forKey: .bannerURL)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        
        if self.bannerURL == nil {
            self.bannerURL = try container.decodeIfPresent(String.self, forKey: .imageURL)
        }
    }
    
    // MARK: Visible
    var layoutView: CardLayoutView?
    var height: CGFloat?
    var width: CGFloat?
    
    // MARK: Selectable
    var actionOnTap: ((Model?) -> Void)?
}

struct ListResponse: Decodable, Model, ListItemResponseViewModelMap {
    
    var spotlight: [Item]?
    var products: [Item]?
    var cash: Item?
}
