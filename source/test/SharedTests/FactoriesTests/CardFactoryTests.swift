//
//  CardFactoryTests.swift
//  HeartOfStoneViewerTests
//
//  Created by Tiago Amaral on 22/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

import SnapshotTesting
final class CardFactoryTests: XCTestCase {

    var sut: CardFactory?

    override func setUp() {
        sut = CardConstructor()
    }

    func testMakeListContentLayoutCard() {
        
        let response = MockerContentProvider().listItem(type: ResponseList.self)
        var model = response?.cards?.first
        model?.layoutView = .cardListItemView
        guard let card = sut?.makeCard(from: model) as? CardVisible else {
            XCTFail("Expect one valid instance")
            return
        }
        XCTAssertNotNil(card)
    }
    
    func testMakeDetailContentLayoutCard() {
        let response = MockerContentProvider().listItem(type: ResponseList.self)
        var model = response?.cards?.first
        model?.layoutView = .cardDetailItemView
        guard let card = sut?.makeCard(from: model) as? CardVisible else {
            XCTFail("Expect one valid instance")
            return
        }
        XCTAssertNotNil(card)
    }
    
    func testModelWithLayioutViewValueNil() {
        let response = MockerContentProvider().listItem(type: ResponseList.self)
        var model = response?.cards?.first
        
        let card = sut?.makeCard(from: model) as? CardVisible
        XCTAssertNil(card, "Expect a nil value")
    }
    
    func testReceiveNilItem() {
        let card = sut?.makeCard(from: nil) as? CardVisible
        XCTAssertNil(card, "Expect a nil value")
    }
}
