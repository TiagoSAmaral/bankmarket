//
//  ListItemViewModelMap.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 22/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListItemViewModelMap: CardFullImageViewModel, Selectable where Self: Visible {
    var title: String? { get }
    var bannerURL: String? { get }
    var description: String? { get }
}

protocol ListItemResponseViewModelMap {
    var spotlight: [Item]? { get }
    var products: [Item]? { get }
    var cash: Item? { get }
}

protocol ListItemViewModelVisible: Visible {
    var layoutView: CardLayoutView? { get set }
    var items: [ListItemViewModelMap]? { get set }
    var title: String? { get set }
}

struct ListItemViewModelMapped: ListItemViewModelVisible, CardTitleViewModel {
    var title: String?
    var height: CGFloat?
    var width: CGFloat?
    var layoutView: CardLayoutView?
    var items: [ListItemViewModelMap]?
}
