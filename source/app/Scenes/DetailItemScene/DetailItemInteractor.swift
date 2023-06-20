//
//  ListInteractor.swift
//  BaseProjectTarget
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
    var workerSecurity: SecurityWorker?
    var workerApiPathBuilder: WorkerURLPathBuilder?
    var currentLocale: String = "pt_BR"
    var selectedItem: Model?
    var presenter: DetailItemPresentationLogic?
    var metadata: Metadata?
    
    func fetchItem() {
        
        let requestGroup =  DispatchGroup()
        var authToken: String?
        
        requestGroup.enter()
        
        workerSecurity?.getUserToken(handler: { [weak self] result in
            switch result {
            case .success(let token):
                authToken = token
            case .failure(let error):
                self?.presenter?.message(string: error.message)
            }
            
            requestGroup.leave()
        })
        
        requestGroup.notify(queue: DispatchQueue.main) { [weak self] in
            self?.requestMetadata(with: authToken)
        }
    }
    
    func requestMetadata(with token: String?) {
        
        guard let token = token else {
            presenter?.message(string: "")
            return
        }
        
        guard let urlPath = workerApiPathBuilder?.makeUrlMetadata(with: "pt_BR") else {
            presenter?.message(string: "")
            return
        }
        
        let apiParams = ApiParams(urlPath: urlPath, token: token, method: .get, params: nil)
        workerNetwork?.request(with: apiParams, resultType: Metadata.self) { [weak self] result in
            switch result {
            case .success(let metadata):
                self?.metadata = metadata
            case .failure(let error):
                self?.presenter?.message(string: error.message)
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.bindMetadata()
                self?.presenter?.presentItem(with: self?.selectedItem)
            }
        }
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
