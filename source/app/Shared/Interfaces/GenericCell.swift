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
    var reuseIdentifier: String? { get }
    func prepareForReuse()
}

extension GenericCell {
    
    var reuseIdentifier: String? {
        Self.classIdentifier
    }
        
    func customPrepareForReuse() {
        contentView.backgroundColor = nil
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
