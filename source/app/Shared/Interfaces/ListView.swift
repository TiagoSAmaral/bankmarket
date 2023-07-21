//
//  List.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol ListView: UIScrollView, ListEvent {
    var cardFactory: CardFactory? { get set }
}
