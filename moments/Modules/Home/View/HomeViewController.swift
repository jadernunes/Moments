//
//  HomeViewController.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Attributes
    
    private(set) var viewModel: HomeViewModelProtocol?
    
    // MARK: - Outlets
    
    private(set) lazy var viewHeader = UIView()
    private(set) lazy var viewFooter = UIView()
    private(set) lazy var labelTitleHeader: UILabel = {
        let label = UILabel()
        label.text = .localizable("titleHeader")
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    private(set) lazy var labelSubHeader: UILabel = {
        let label = UILabel()
        label.text = .localizable("subtitleHeader")
        return label
    }()
    private(set) lazy var labelTitleFooter: UILabel = {
        let label = UILabel()
        label.text = .localizable("titleFooter")
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    private(set) lazy var labelSubFooter: UILabel = {
        let label = UILabel()
        label.text = .localizable("subtitleFooter")
        return label
    }()
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.alwaysBounceVertical = true
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray()
        tableView.contentInset = .init(top: 64, left: 0, bottom: 0, right: 0)
        tableView.register(FlowCell.self, forCellReuseIdentifier: FlowCell.className)
        tableView.tableHeaderView = viewHeader
        tableView.tableFooterView = viewFooter
        return tableView
    }()
    private(set) lazy var stackIcons: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [
            UIImageView(image: UIImage(named: "upload")),
            UIImageView(image: UIImage(named: "comments")),
            UIImageView(image: UIImage(named: "views")),
            UIImageView(image: UIImage(named: "refresh")),
            UIImageView(image: UIImage(named: "unliked"))
        ])
        
        stack.backgroundColor = .darkGray()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        return stack
    }()
    
    // MARK: - Life cycle
    
    init(viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        createElements()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        updateHeaderViewHeight(for: tableView.tableHeaderView)
        updateHeaderViewHeight(for: tableView.tableFooterView)
    }
    
    // MARK: - Custom methods
    
    private func updateHeaderViewHeight(for header: UIView?) {
        guard let header = header else { return }
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: view.bounds.width - 32.0, height: 0)).height
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray()
    }
    
    private func createElements() {
        addTableView()
        addTitleHeader()
        addSubTitleHeader()
        addTitleFooter()
        addSubTitleFooter()
        addListIcons()
        
        tableView.tableHeaderView?.layoutIfNeeded()
        tableView.tableFooterView?.layoutIfNeeded()
    }
}

// MARK: - TableView delegate

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        .localizable("titleSectionHome")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.countFlows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FlowCell.className, for: indexPath) as? FlowCell,
            let flow = viewModel?.getFlow(index: indexPath.row)
        else { return UITableViewCell() }
        
        cell.configure(viewModel: FlowCellViewModel(flow: flow))
        return cell
    }
}
