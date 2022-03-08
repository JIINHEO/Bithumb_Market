//
//  TransactionViewController.swift
//  BithumbMarket
//
//  Created by jiinheo on 2022/02/24.
//

import UIKit

final class TransactionViewController: UIViewController {
    
    private let datasource: TransactionDataSource
    
    init(datasource: TransactionDataSource) {
        self.datasource = datasource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.datasource = .init()
        super.init(coder: coder)
    }
    
    private lazy var headerView: TransactionHeaderView = {
        let view = TransactionHeaderView()
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 45
        view.estimatedRowHeight = 45
        view.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        view.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionNameSpace.cellReuseIdentifier)
        view.dataSource = datasource
        return view
    }()
    
    var fetchTransactionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = TransactionNameSpace.navigationTitle
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.shadowImage = UIImage()
        setupView()
        fetchTransactionHandler?()
    }
    
    lazy var updateDataSource: (([TransactionData]) -> Void)? = { [weak self] transactionData in
        self?.datasource.items = transactionData
    }

    lazy var updateTableView = { [weak self] in
        DispatchQueue.main.async {
            self?.tableView.reloadData()
        }
    }

    lazy var insertRowTableView = { [weak self] in
        UIView.performWithoutAnimation {
            self?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
    }
    
}

extension TransactionViewController {
    
    func setupView() {
        [headerView, tableView].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}

