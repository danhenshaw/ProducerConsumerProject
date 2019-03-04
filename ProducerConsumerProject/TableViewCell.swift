//
//  TableViewCell.swift
//  ProducerConsumerProject
//
//  Created by Daniel Henshaw on 1/3/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var titleText: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    
    func addViews() {
        addSubview(titleText)
    }
    
    func setupConstraints() {
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        titleText.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        titleText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        titleText.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
    }
    
    
    func bindWith(_ titleString: String?) {
        if let title = titleString {
            titleText.text = title
        }
    }
    
}
