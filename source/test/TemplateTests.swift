//
//  TemplateTests.swift
//  BaseProjectTargetTests
//
//  Created on 31/01/20.
//

import XCTest

class TemplateTests: XCTestCase {
    func testCheckReadmeMessage() {
        XCTAssertEqual(LocalizedText.with(tagName: .nameText ), "Nome", "Expect equals")
    }
}
