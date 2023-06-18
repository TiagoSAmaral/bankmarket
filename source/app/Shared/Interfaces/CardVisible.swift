//
//  CardVisible.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol CardVisible where Self: UIView {
    func load(model: Model?)
}

extension CardVisible {
    func defineLayout(with cellContentView: UIView?) {
        
        guard let cellContentView = cellContentView else {
            return
        }
        cellContentView.addSubviews([self])
        
        edgeToSuperView()
    }
}
