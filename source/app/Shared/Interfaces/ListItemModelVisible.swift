//
//  ListItemModelVisible.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemModelVisible: Visible where Self: Model {
    var imageUrlPath: String? { get }
    var title: String? { get }
    var flavorDescription: String? { get }
}
