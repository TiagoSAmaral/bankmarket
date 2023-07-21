//
//  Selectable.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol Selectable where Self: Model {
    
    var actionOnTap: ((Model?) -> Void)? { get set }
}
