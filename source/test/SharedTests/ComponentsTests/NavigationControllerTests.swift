//
//  NavigationControllerTests.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import SnapshotTesting
import XCTest

final class NavigationControllerTests: XCTestCase {

    let isRecording = false
    
    func testNavigationLayout() {
        let fakeViewController = UIViewController()
        fakeViewController.title = "Test navigation"
        let navigation = NavigationController()
        navigation.viewControllers = [fakeViewController]
        assertSnapshot(matching: navigation, as: .image, record: isRecording)
    }
}
