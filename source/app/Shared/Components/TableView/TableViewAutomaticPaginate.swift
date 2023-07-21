//
//  TableView.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

// MARK: Disabled in Target Membership. See into right panel ------->>>

//class TableViewAutomaticPaginate: UITableView, UITableViewDelegate, UITableViewDataSource, List {
//
//    private(set) weak var controller: ListDataSource?
//    var cardFactory: CardFactory?
//    private(set) var isPullToRefreshEnable = false
//    private(set) var isPaginateEnable = false
//    private(set) var propagateEvent: (() -> Void)?
//
//    init(controller: ListDataSource?, isPullToRefreshEnable: Bool = false) {
//        super.init(frame: .zero, style: .plain)
//        self.controller = controller
//        self.isPullToRefreshEnable = isPullToRefreshEnable
//        defaultSetup()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        defaultSetup()
//    }
//
//    private func defaultSetup() {
//        delegate = self
//        dataSource = self
//        separatorStyle = .none
//        separatorInset = .zero
//        allowsSelection = false
//        rowHeight = UITableView.automaticDimension
//        backgroundColor = .clear
//        registerTableViewCell()
//        makePullToRefresh()
//    }
//
//    func makePullToRefresh() {
//        if isPullToRefreshEnable {
//            let refreshControl = UIRefreshControl()
//            refreshControl.attributedTitle = NSAttributedString(string: LocalizedText.with(tagName: .pullToRefreshText))
//            refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//            self.refreshControl = refreshControl
//        } else {
//         refreshControl = nil
//        }
//    }
//
//    @objc func refresh() {
//        controller?.pullToRefreshEvent()
//    }
//
//    func registerTableViewCell() {
//        register(GenericTableViewCell.self, forCellReuseIdentifier: GenericTableViewCell.classIdentifier)
//    }
//
//    func reloadView() {
//        reloadData()
//        refreshControl?.endRefreshing()
//    }
//
//// MARK: - UITableViewDataSource Implementation
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        controller?.numberOfSections() ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        controller?.numberOfRow(at: section) ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let model = controller?.getModel(at: indexPath) else {
//            return UITableViewCell()
//        }
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: GenericTableViewCell.classIdentifier,
//                                                       for: indexPath) as? GenericTableViewCell ?? GenericTableViewCell()
//        let card = cardFactory?.makeCard(from: model as? Visible)
//        card?.defineLayout(with: cell.contentView)
//        return cell
//    }
//}
