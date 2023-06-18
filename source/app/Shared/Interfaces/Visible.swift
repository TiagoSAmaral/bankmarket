//
//  Visible.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol Visible where Self: Model {
    
    var layoutView: CardLayoutView? { get set }
}
