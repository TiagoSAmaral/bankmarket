//
//  MosaicBaseView.swift
//  HeartOfStoneViewerTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class MosaicBaseViewTests: XCTestCase {

    var sut: MosaicBaseView?
    
    override func setUp() {
        sut = MosaicBaseView()
    }
    
    func testInit() {
        XCTAssertEqual(sut?.baseView.subviews.count, 1)
    }
    
    func testInsertView() {
        let viewA: UIView = UIView()
        let viewB: UIView = UIView()
        let viewC: UIView = UIView()

        sut?.insertNew(view: viewA)
        sut?.insertNew(view: viewB)
        sut?.insertNew(view: viewC)
        
        XCTAssertEqual(sut?.vStackView.subviews.count, 3)
    }
}
