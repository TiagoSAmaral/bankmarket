//
//  ListViewModel.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

final class ListItemViewModel: Model, ListItemModelVisible {
    var layoutView: CardLayoutView?
    var imageUrlPath: String?
    var title: String?
    var flavorDescription: String?
}


/*
    ResponseItems
        items
        page
 
    ViewModel
        items
    
 */
