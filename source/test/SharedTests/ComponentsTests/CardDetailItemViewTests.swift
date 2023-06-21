//
//  CardDetailItemViewTests.swift
//  HeartOfStoneViewerTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import SnapshotTesting
import XCTest

final class CardDetailItemViewTests: XCTestCase {
    
    let isRecording = false
    
    func testCardDetailItemViewLayout() {
        let response = MockerContentProvider().listItem(type: ResponseList.self)
        let model = response?.cards?.first
        let canvasView = UIView()
        canvasView.height(862).width(320)
        
        let card = CardDetailItemView()
        card.load(model: model)
        card.defineLayout(with: canvasView)
        card.imageView.image = UIImage(named: "fullItemImage", in: Bundle(for: CardListItemViewTests.self), with: nil)
        assertSnapshot(matching: canvasView, as: .image, record: isRecording)
    }
    
    func testBindAction() {
        var isChanged = false
        let response = MockerContentProvider().listItem(type: ResponseList.self)
        var model = response?.cards?.first
        model?.actionOnTap = { model in
            isChanged = !isChanged
        }
        
        let card = CardListItemView()
        card.load(model: model)
        card.actionWhenTap()
        XCTAssertTrue(isChanged)
    }
}
