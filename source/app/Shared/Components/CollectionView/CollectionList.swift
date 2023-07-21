//
//  CollectionView.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class CollectionList: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, ListView {
    
    weak var listDataSource: ListDataSource?
    var cardFactory: CardFactory?
    var heightView: CGFloat = 0.0
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
    }

    func registerTemplateCell() {
        register(GenericCollectionViewCell.self, forCellWithReuseIdentifier: GenericCollectionViewCell.classIdentifier)
    }

    func activePaginateCenter() {
        paginateToCenter = true
        delegate = self
    }

    func disablePaginateCenter() {
        paginateToCenter = false
        delegate = nil
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        centerCardPaginated()
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        centerCardPaginated()
    }

    func centerCardPaginated() {
        guard paginateToCenter else {
            return
        }
        var currentCellOffset = contentOffset
        currentCellOffset.x += frame.size.width / 2
        guard let indexPath = indexPathForItem(at: currentCellOffset) else {
            return
        }
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
//        view.makeLayout(in: cell.contentView)
        return cell
    }
}

