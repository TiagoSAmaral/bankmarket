//
//  ListItemlayoutAdapter.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 22/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ActionProvider {
    var actionTap: ((Model?) -> Void)? { get set }
}

protocol ListItemLayoutAdaptable {
    func mapByPropertySetViewLayout(item: ListItemResponseViewModelMap?, with actionProvider: ActionProvider?) -> [ListItemViewModelVisible]
}

struct ListItemLayoutAdapter: ListItemLayoutAdaptable {
    
    func mapByPropertySetViewLayout(item: ListItemResponseViewModelMap?, with actionProvider: ActionProvider?) -> [ListItemViewModelVisible] {
        guard let item = item else {
            return []
        }
        
        var products: [ListItemViewModelVisible] = []
        
        if let spotlightSection = mapSection(with: item.spotlight, baseView: .bannerScrollableView, itemView: .bannerCardView, with: actionProvider) {
            products.append(spotlightSection)
        }
        
        if let cashItem = item.cash, let cashDigioSection = mapSection(with: [cashItem], baseView: .cashDigioScrollableView, itemView: .cashDigioCardView, with: actionProvider) {
            if let productSectionTitle = mapSection(with: cashItem.title) {
                products.append(productSectionTitle)
            }
            products.append(cashDigioSection)
        }
        
        if let productSection = mapSection(with: item.products, baseView: .productScrollableView, itemView: .productCardView, with: actionProvider) {
            
            if let productSectionTitle = mapSection(with: "Produtos") {
                products.append(productSectionTitle)
            }
            products.append(productSection)
        }

        return products
    }
    
    func mapSection(with title: String?) -> ListItemViewModelVisible? {
        guard let title = title else {
            return nil
        }
        var customItem = ListItemViewModelMapped()
        customItem.layoutView = .titleCardView
        customItem.title = title
        if let sizeBaseView = CardMapSizeLayout.defineSize(of: .titleCardView) {
            customItem.height = sizeBaseView.0
            customItem.width = sizeBaseView.1
        }
        
        return customItem
    }
    
    func mapSection(with content: [ListItemViewModelMap]?, baseView: CardLayoutView, itemView: CardLayoutView, with actionProvider: ActionProvider?) -> ListItemViewModelVisible? {
        guard var content = content else {
            return nil
        }
        var section: ListItemViewModelVisible = ListItemViewModelMapped()
        if let sizeBaseView = CardMapSizeLayout.defineSize(of: baseView) {
            section.height = sizeBaseView.0
            section.width = sizeBaseView.1
        }
        section.layoutView = baseView
        for index in content.indices {
            content[index].layoutView = itemView
            if let sizeBaseView = CardMapSizeLayout.defineSize(of: itemView) {
                content[index].height = sizeBaseView.0
                content[index].width = sizeBaseView.1
                content[index].actionOnTap = actionProvider?.actionTap
            }
        }
        section.items = content
        return section
    }
}
