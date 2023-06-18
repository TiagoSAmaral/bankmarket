//
//  ResponseListItems.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

final class ResponseList: Decodable {
    let cards: [Item]?
    let page: Int?
}
