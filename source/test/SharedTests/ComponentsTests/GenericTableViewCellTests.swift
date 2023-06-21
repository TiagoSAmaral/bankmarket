//
//  GenericTableViewCellTests.swift
//  HeartOfStoneViewerTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class GenericTableViewCellTests: XCTestCase {

    var sut: GenericTableViewCell?
    
    override func setUp() {
        sut = GenericTableViewCell(style: .default, reuseIdentifier: .empty)
    }
    
    func testInit() {
        XCTAssertEqual(sut?.backgroundColor, UIColor.clear)
        XCTAssertEqual(sut?.contentView.backgroundColor, UIColor.clear)
    }
    
    func testClearBackground() {
        sut?.defineClearBackground()
        XCTAssertEqual(sut?.backgroundColor, UIColor.clear)
        XCTAssertEqual(sut?.contentView.backgroundColor, UIColor.clear)
    }

    func testCustomPrepareForReuse() {
        
        let view = UIView()
        sut?.contentView.addSubviews([view])
        XCTAssertEqual(sut?.contentView.subviews.count, 1)
        
        sut?.customPrepareForReuse()
        XCTAssertEqual(sut?.contentView.subviews.count, 0)
    }
}
