//
//  GenericTableViewCell.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class GenericTableViewCell: UITableViewCell, GenericCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defineClearBackground()
    }
    
    func defineClearBackground() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        defineClearBackground()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customPrepareForReuse()
    }
}
