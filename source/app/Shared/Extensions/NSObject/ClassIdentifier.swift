//
//  ClassIdentifier.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ClassIdentifier {}

extension ClassIdentifier where Self: NSObject {
    static var classIdentifier: String {
        String(describing: self)
    }
}

extension NSObject: ClassIdentifier {}
