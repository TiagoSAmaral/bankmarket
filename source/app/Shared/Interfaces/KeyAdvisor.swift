//
//  KeyAdvisor.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol KeyAdvisor {
    var publicKeyApi: String { get }
    var privateKeyApi: String { get }
}
