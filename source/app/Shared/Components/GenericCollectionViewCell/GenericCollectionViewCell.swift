//
//  GenericCollectionViewCell.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class GenericCollectionViewCell: UICollectionViewCell, GenericCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        defineClearBackground()
    }
    
    func defineClearBackground() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customPrepareForReuse()
    }
}

