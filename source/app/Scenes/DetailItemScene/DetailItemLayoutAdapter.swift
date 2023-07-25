//
//  DetailItemAdapter.swift
//  bankmarket
//
//  Created by Tiago Amaral on 25/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol DetailItemAdaptable {
    func mapByPropertySetViewLayout(item: Model?) -> [ListItemViewModelMap]
}

struct DetailItemAdapter: DetailItemAdaptable {
    func mapByPropertySetViewLayout(item: Model?) -> [ListItemViewModelMap] {

        var newItem = Item()
        newItem.layoutView = .dumpDetailCardView
        newItem.title = (item as? CardDumpDetailViewModel)?.title
        newItem.description = (item as? CardDumpDetailViewModel)?.description
        
        if let sizeBaseView = CardMapSizeLayout.defineSize(of: .dumpDetailCardView) {
            newItem.height = sizeBaseView.0
            newItem.width = sizeBaseView.1
        }
        
        return [newItem]
    }
}
