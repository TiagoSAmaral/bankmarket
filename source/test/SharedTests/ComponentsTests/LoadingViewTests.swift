//
//  LoadingViewTests.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 21/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import SnapshotTesting
import XCTest

final class LoadingViewControllerTests: XCTestCase {
    
    let isRecording = false
    
    func testNavigationLayout() {
        let fakeViewController = LoadingViewController()
        fakeViewController.title = "Test LoadingViewController"
        let navigation = NavigationController()
        navigation.viewControllers = [fakeViewController]
        assertSnapshot(matching: navigation, as: .image, record: isRecording)
    }
}
