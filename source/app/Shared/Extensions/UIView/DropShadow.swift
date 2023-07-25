//
//  DropShadow.swift
//  bankmarket
//
//  Created by Tiago Amaral on 25/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset =  CGSize.zero
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
    }
}
