//
//  TemplateTests.swift
//  BaseProjectTargetTests
//
//  Created on 31/01/20.
//

import XCTest

class TemplateTests: XCTestCase {
    func testCheckReadmeMessage() {
        let text = NSLocalizedString(LocalizedText.LocalizeTags.nameText.rawValue, bundle: Bundle(for: TemplateTests.self), comment: .empty)
        XCTAssertEqual(text, "Name", "Expect equals")
    }
}
