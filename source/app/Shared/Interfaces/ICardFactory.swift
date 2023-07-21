//
//  ICardFactory.swift
//  bankmarket
//
//  Created by Tiago Amaral on 20/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

protocol CardFactory {
    func makeCard(from item: Visible?) -> CardVisible?
}
