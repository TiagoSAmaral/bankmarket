//
//  TemplateTests.swift
//  BaseProjectTargetTests
//
//  Created on 31/01/20.
//

import XCTest
@testable import BaseProjectTarget

class TemplateTests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testCheckReadmeMessage() {
        let expectedString = "Verifique o arquivo Readme! \n Português Brasil"
        let foundString = LocalizedText.with(tagName: LocalizedText.LocalizeTags.messageReadme)
        XCTAssertEqual(foundString, expectedString, "Expect equals")
    }
}
