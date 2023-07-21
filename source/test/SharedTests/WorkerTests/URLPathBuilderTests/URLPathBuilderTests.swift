//
//  URLPathBuilderTests.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 22/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class URLPathBuilderTests: XCTestCase {

    var sut: URLPathBuilder?
    
    override func setUp() {
        sut = URLPathBuilder()
    }
    
    func testInit() {
        
        XCTAssertEqual(sut?.contentBaseUrl?.url?.absoluteString, "https://us.api.blizzard.com")
        XCTAssertEqual(sut?.authorizationBaseUrl?.url?.absoluteString, "https://oauth.battle.net/token")
    }
    
    func testMakeUrlCards() {
        let urlString = sut?.makeUrlCards(with: 1, locale: "en_US")?.absoluteString
        let expectedString = "https://us.api.blizzard.com/hearthstone/cards?page=1&locale=en_US"
        
        XCTAssertEqual(urlString, expectedString)
    }
    
    func testMakeUrlMetadata() {
        let urlString = sut?.makeUrlMetadata(with: "en_US")?.absoluteString
        let expectedString = "https://us.api.blizzard.com/hearthstone/metadata?locale=en_US"
        
        XCTAssertEqual(urlString, expectedString)
    }
    
    func testMakeAuthUrl() {
        let urlString = sut?.makeUrlAuthorization()?.absoluteString
        let expectedString = "https://oauth.battle.net/token"
        
        XCTAssertEqual(urlString, expectedString)
    }
}
