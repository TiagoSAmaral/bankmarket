//
//  ListEvent.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListEvent {
    func reloadView()
    func pullToRefreshEvent()
}

extension ListEvent {
    func pullToRefreshEvent() {}
}
