//
//  GenericTableViewCell.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class GenericTableViewCell: UITableViewCell, GenericCell {
        
    override func prepareForReuse() {
        super.prepareForReuse()
        customPrepareForReuse()
    }
}
