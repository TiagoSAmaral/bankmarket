//
//  Metadata.swift
//
//  Created by Tiago Amaral on 16/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

struct Metadata: Decodable {
    
    let sets: [MetadataItem]?
    let types: [MetadataItem]?
    let rarities: [MetadataItem]?
}
