//
//  GenericTableViewCellTests.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class GenericCollectionViewCellTests: XCTestCase {

    var sut: GenericCollectionViewCell?
    
    override func setUp() {
        sut = GenericCollectionViewCell(frame: .zero)
        
//        GenericCollectionViewCell(style: .default, reuseIdentifier: .empty)
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
        
        sut?.prepareForReuse()
        XCTAssertEqual(sut?.contentView.subviews.count, 0)
    }
    
    func testInitCoder() {
        let cell = GenericCollectionViewCell(coder: NSCoder())
        XCTAssertNil(cell)
    }
}
