//
//  ListView.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol ListItemVisible where Self: UIView {
    
}

final class ListItemView: UIView, ListItemVisible {
    
    var tableView: TableViewUpdateEvent?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
