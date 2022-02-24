//
//  TransactionTableViewCell.swift
//  BithumbMarket
//
//  Created by jiinheo on 2022/02/24.
//

import Foundation
import UIKit

final class TransactionTableViewCell: UITableViewCell {
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var quntityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func configure(transaction: Transaction) {
        timeLabel.text = transaction.time
        priceLabel.text = transaction.price
        quntityLabel.text = transaction.quntity
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TransactionTableViewCell {
    
    func setupView() {
        [
            timeLabel,
            priceLabel,
            quntityLabel
        ].forEach{addSubview($0)}
        
        [
            timeLabel,
            priceLabel,
            quntityLabel
        ].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}

        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: quntityLabel.leadingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            quntityLabel.topAnchor.constraint(equalTo: self.topAnchor),
            quntityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            quntityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            quntityLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}