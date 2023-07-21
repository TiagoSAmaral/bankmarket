//
//  ListInteractor.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol DetailItemInteractorBusinessLogic {
    func fetchItem()
}

final class DetailItemInteractor: DetailItemInteractorBusinessLogic {
    
    var workerNetwork: NetworkWorker?
    var workerApiPathBuilder: WorkerURLPathBuilder?
    var currentLocale: String = LocalizedText.with(tagName: .localizationApi)
    var selectedItem: Model?
    var presenter: DetailItemPresentationLogic?
    var metadata: Metadata?
    
    func fetchItem() {
    }
    
    func requestMetadata(with token: String?) {
    }
    
    func bindMetadata() {
        bindSet()
        bindType()
        bindRarity()
    }
    
    func bindSet() {
        guard var selectedItem = selectedItem as? Item else {
            return
        }
        metadata?.sets?.forEach({ metadataItem in
            
            if metadataItem.id == selectedItem.cardSetId {
                selectedItem.cardSet = metadataItem
            }
        })
        self.selectedItem = selectedItem
    }
    
    func bindType() {
        guard var selectedItem = selectedItem as? Item else {
            return
        }
        metadata?.types?.forEach({ metadataItem in
            
            if metadataItem.id == selectedItem.cardTypeId {
                selectedItem.cardType = metadataItem
            }
        })
        self.selectedItem = selectedItem
    }
    
    func bindRarity() {
        guard var selectedItem = selectedItem as? Item else {
            return
        }
        metadata?.rarities?.forEach({ metadataItem in
            
            if metadataItem.id == selectedItem.rarityId {
                selectedItem.rarity = metadataItem
            }
        })
        self.selectedItem = selectedItem
    }
}
