//
//  CardVisible.swift
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol CardVisible where Self: UIView {
    func defineLayout(with cellContentView: UIView?)
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

protocol CardStaticVisible where Self: CardVisible {
    func load(model: Model?)
}

protocol CardScrollableVisible where Self: CardVisible {
    func load(listDataSource: ListDataSource?, cardFactory: CardFactory)
}
