//
//  TableViewAutomaticPaginate.swift
//  bankmarketTests
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import XCTest

final class TableViewAutomaticPaginateTests: XCTestCase {
    
    var sut: TableViewAutomaticPaginate?
    var controller: ControllerFake?
    
    override func setUp() {
        controller = ControllerFake()
        let responseItem = MockerContentProvider().listItem(type: ResponseList.self)
        controller?.items = responseItem?.cards
        controller?.defineLayout()
        sut = TableViewAutomaticPaginate(controller: controller, isPullToRefreshEnable: true, isPaginateEnable: true)
        sut?.cardFactory = CardConstructor()
    }
    
    func testInit() {
        
        XCTAssertNotNil(sut!.controller)
        XCTAssertTrue(sut!.isPullToRefreshEnable)
        XCTAssertTrue(sut!.isPaginateEnable)
        XCTAssertNotNil(sut?.refreshControl)
        XCTAssertNotNil(sut?.delegate)
        XCTAssertNotNil(sut?.dataSource)
        XCTAssertEqual(sut!.separatorStyle, .none)
        XCTAssertEqual(sut?.separatorInset, .zero)
        XCTAssertEqual(sut?.allowsSelection, false)
        XCTAssertEqual(sut?.rowHeight, UITableView.automaticDimension)
        XCTAssertEqual(sut?.backgroundColor, .clear)
    }
    
    func testScrollToEnd() {

        sut?.scrollToRow(at: IndexPath(row: 39, section: 0), at: .bottom, animated: false)
        XCTAssertTrue(controller!.isNextPaginateInvoKed)
    }
    
    func testPullToRefresh() {

        sut?.refresh()
        XCTAssertTrue(controller!.isPullToRefreshInvoked)
    }
    
    func testReloadView() {
        sut?.scrollingHasComeToEnd()
        sut?.refreshControl?.beginRefreshing()
        
        XCTAssertTrue(sut!.refreshControl!.isRefreshing)
        XCTAssertFalse(sut!.isPaginateEnable)
        
        sut?.reloadView()
        XCTAssertFalse(sut!.refreshControl!.isRefreshing)
        XCTAssertTrue(sut!.isPaginateEnable)
    }
}

final class ControllerFake: UIViewController, TableViewAutomaticPaginateDelegate {
    
    var isNextPaginateInvoKed: Bool = false
    var isPullToRefreshInvoked: Bool = false
    var items: [Item]?
    
    func nextPageEvent() {
        isNextPaginateInvoKed = true
    }
    
    func pullToRefreshEvent() {
        isPullToRefreshInvoked = true
    }
    
    func defineLayout() {
        guard let items = items else {
            return
        }
        for index in items.indices {
            self.items?[index].layoutView = .cardListItemView
        }
    }
    
    func numberOfSections() -> Int {
        items == nil ? .zero: 1
    }
    
    func numberOfRow(at section: Int) -> Int {
        items?.count ?? .zero
    }
    
    func getModel(at indexPath: IndexPath) -> Model? {
        items?[indexPath.row]
    }
}
