//
//  Visible.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol Visible where Self: Model {
    var layoutView: CardLayoutView? { get set }
    var height: CGFloat? { get set }
    var width: CGFloat? { get set }
}
