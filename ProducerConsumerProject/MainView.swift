//
//  MainView.swift
//  ProducerConsumerProject
//
//  Created by Daniel Henshaw on 1/3/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    lazy var producerButton: UIButton = {
        let button = UIButton()
        button.setTitle("ADD PRODUCER (0)", for: .normal)
        button.tag = 1
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        return button
    }()
    
    lazy var consumerButton: UIButton = {
        let button = UIButton()
        button.setTitle("ADD CONSUMER (0)", for: .normal)
        button.tag = 2
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(tableView)
        addSubview(producerButton)
        addSubview(consumerButton)
    }
    
    func setupConstraints() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.frame.size.height * 0.85).isActive = true
        
        producerButton.translatesAutoresizingMaskIntoConstraints = false
        producerButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 4).isActive = true
        producerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        producerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -4).isActive = true
        producerButton.widthAnchor.constraint(equalToConstant: self.bounds.size.width / 2 - 12).isActive = true
        
        consumerButton.translatesAutoresizingMaskIntoConstraints = false
        consumerButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 4).isActive = true
        consumerButton.leadingAnchor.constraint(equalTo: producerButton.trailingAnchor, constant: 4).isActive = true
        consumerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        consumerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -4).isActive = true
        
    }
    
    
    
}
