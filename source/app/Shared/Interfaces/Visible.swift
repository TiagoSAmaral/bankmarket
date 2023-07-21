//
//  Visible.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

protocol Visible where Self: Model {
    
    var layoutView: CardLayoutView? { get set }
}
