//
//  CollectionView.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class CollectionList: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, ListView, UICollectionViewDelegateFlowLayout {
    
    weak var listDataSource: ListDataSource?
    var cardFactory: CardFactory?
    var paginateToCenter = false

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        registerTemplateCell()
        setupCollection()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupCollection() {
        dataSource = self
        delegate = self
        backgroundColor = .clear
    }

    func registerTemplateCell() {
        register(GenericCollectionViewCell.self, forCellWithReuseIdentifier: GenericCollectionViewCell.classIdentifier)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let model = listDataSource?.getModel(at: indexPath) as? Visible,
              let height = model.height,
              let width = model.width else {
            return .zero
        }
       return CGSize(width: width, height: height)
    }
    
    // MARK: - List
    func reloadView() {
        reloadData()
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listDataSource?.numberOfRow(at: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenericCollectionViewCell.classIdentifier, for: indexPath) as? GenericCollectionViewCell,
              let model = listDataSource?.getModel(at: indexPath) else {
            return UICollectionViewCell(frame: .zero)
        }
        
        let card = cardFactory?.makeCard(from: model, orWith: (model as? ListItemViewModelVisible)?.items)
        
        card?.defineLayout(with: cell)
        return cell
    }
}

