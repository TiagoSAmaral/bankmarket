//
//  TableView.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit



class TableViewAutomaticPaginate: UITableView, UITableViewDelegate, UITableViewDataSource, TableViewUpdateEvent {

    private weak var controller: TableViewAutomaticPaginateDelegate?
    var cardFactory: CardFactory?
    private var isPullToRefreshEnable = false
    private var isPaginateEnable = false
    private var propagateEvent: (() -> Void)?
    
    init(controller: TableViewAutomaticPaginateDelegate?, isPullToRefreshEnable: Bool = false, isPaginateEnable: Bool = false) {
        super.init(frame: .zero, style: .plain)
        self.controller = controller
        self.isPullToRefreshEnable = isPullToRefreshEnable
        self.isPaginateEnable = isPaginateEnable
        defaultSetup()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        defaultSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        defaultSetup()
    }

    private func defaultSetup() {
        delegate = self
        dataSource = self
        separatorStyle = .none
        separatorInset = .zero
        allowsSelection = false
        rowHeight = UITableView.automaticDimension
        backgroundColor = .clear
        registerEventScrollDidEnd()
        registerTableViewCell()
        makePullToRefresh()
    }
    
    func scrollingHasComeToEnd() {
        isPaginateEnable = false
        propagateEvent?()
    }
    
    func allowEmitScrollingHasComeToEnd() {
        isPaginateEnable = true
    }
    
    func register(event: (() -> Void)?) {
        propagateEvent = event
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > (scrollView.contentSize.height - (scrollView.frame.size.height + 400.0)) {
            if isPaginateEnable {
                scrollingHasComeToEnd()
            }
        }
    }
    
    func makePullToRefresh() {
        if isPullToRefreshEnable {
            let refreshControl = UIRefreshControl()
            refreshControl.attributedTitle = NSAttributedString(string: LocalizedText.with(tagName: .pullToRefreshText))
            refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
            self.refreshControl = refreshControl
        } else {
         refreshControl = nil
        }
    }
    
    @objc func refresh() {
        controller?.pullToRefreshEvent()
    }
    
    func registerTableViewCell() {
        register(GenericTableViewCell.self, forCellReuseIdentifier: GenericTableViewCell.classIdentifier)
    }
    
    func reloadView() {
        reloadData()
        refreshControl?.endRefreshing()
        allowEmitScrollingHasComeToEnd()
    }
    
    func registerEventScrollDidEnd() {
        register { [weak self] in
            self?.controller?.nextPageEvent()
        }
    }
    
// MARK: - UITableViewDataSource Implementation
    
    func numberOfSections(in tableView: UITableView) -> Int {
        controller?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controller?.numberOfRow(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let model = controller?.getModel(at: indexPath) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericTableViewCell.classIdentifier,
                                                       for: indexPath) as? GenericTableViewCell ?? GenericTableViewCell()
        let card = cardFactory?.makeCard(from: model as? Visible)
        card?.defineLayout(with: cell.contentView)
        return cell
    }
    
}
