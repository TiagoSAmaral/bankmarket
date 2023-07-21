//
//  NetworkErrorTests.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class NetworkErrorTests: XCTestCase {
    
    var networkErrorTarget: NetworkError?
    
    let OFFLINE_MESSAGE_TEST = LocalizedText.with(tagName: .networkOffline, bundleClass: NetworkErrorTests.self)
    let BADREQUEST_MESSAGE_TEST = LocalizedText.with(tagName: .networkErrorNotDefined, bundleClass: NetworkErrorTests.self)
    let SERVERNOTRESPONSE_MESSAGE_TEST = LocalizedText.with(tagName: .serverNotResponse, bundleClass: NetworkErrorTests.self)
    let NOTDEFINED_MESSAGE_TEST = LocalizedText.with(tagName: .networkErrorNotDefined, bundleClass: NetworkErrorTests.self)
    override func tearDown() {
        networkErrorTarget = nil
    }

    func testStatusOffline() {
        networkErrorTarget = NetworkError.makeError(with: -1)
        XCTAssertEqual(networkErrorTarget?.message, OFFLINE_MESSAGE_TEST, "Expect same message")
    }
    
    func testStatus400At499() {
        networkErrorTarget = NetworkError.makeError(with: 401)
        XCTAssertEqual(networkErrorTarget?.message, BADREQUEST_MESSAGE_TEST, "Expect same message")
    }
    
    func testStatusAbove499() {
        networkErrorTarget = NetworkError.makeError(with: 500)
        XCTAssertEqual(networkErrorTarget?.message, SERVERNOTRESPONSE_MESSAGE_TEST, "Expect same message")
    }
    
    func testStatusNotDefined() {
        networkErrorTarget = NetworkError.makeError(with: nil)
        XCTAssertEqual(networkErrorTarget?.message, NOTDEFINED_MESSAGE_TEST, "Expect same message")
    }
    
//    func testStatusNotDefined() {
//        networkErrorTarget = NetworkError.makeError(with: nil)
//        XCTAssertEqual(networkErrorTarget?.message, NOTDEFINED_MESSAGE_TEST, "Expect same message")
//    }
}
