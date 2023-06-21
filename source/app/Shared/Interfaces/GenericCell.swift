//
//  GenericCell.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol GenericCell where Self: UIView {
    var contentView: UIView { get }
    func prepareForReuse()
}

extension GenericCell {
        
    func customPrepareForReuse() {
        contentView.backgroundColor = .clear
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
