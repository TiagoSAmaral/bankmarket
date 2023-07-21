//
//  TableViewAutomaticPaginateDelegate.swift
//  bankmarket
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import Foundation

protocol ListDataSource: AnyObject {
    func numberOfSections() -> Int
    func numberOfRow(at section: Int) -> Int
    func getModel(at indexPath: IndexPath) -> Model?
}

