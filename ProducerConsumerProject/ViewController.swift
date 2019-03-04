//
//  ViewController.swift
//  ProducerConsumerProject
//
//  Created by Daniel Henshaw on 1/3/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // dataArray holds all the user added Consumers and Producers
    var dataArray = [DataModel]()
    
    // cellCount is a variable updated by the Model to either add or subtract a value.
    // Everytime the cellCount changes, the table is updated.
    var cellCount = 0 {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    struct Constants {
        static let tableViewCellReuseIdentifier = "TableViewCellReuseIdentifier"
    }
    
    override func loadView() {
        view = MainView()
    }
    
    var mainView: MainView {
        return self.view as! MainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(TableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellReuseIdentifier)
        mainView.producerButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainView.consumerButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // Each button has an assigned tag so that we can use the same function to perform the addition of a new Consumer or Producer
    @objc func buttonPressed(_ sender: UIButton) {
        
        var data: DataModel?
        
        switch sender.tag {
        case 1 : data = DataModel(dataType: .producer)
        case 2 : data = DataModel(dataType: .consumer)
        default : print("Unrecognised button pressd")
        }
        
        if let data = data {
            data.delegate = self
            dataArray.append(data)
        }
        updateButtonTitles()
    }
    
    
    func updateButtonTitles() {
        let consumerCount = dataArray.filter { ($0.dataType == .consumer) }.count
        let producerCount = dataArray.filter { ($0.dataType == .producer) }.count
        mainView.producerButton.setTitle("ADD PRODUCER (\(producerCount))", for: .normal)
        mainView.consumerButton.setTitle("ADD CONSUMER (\(consumerCount))", for: .normal)
    }
    

}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellReuseIdentifier, for: indexPath) as! TableViewCell
        // Each new cell will be assigned a title of "CELL (indexPath.row)"
        cell.bindWith("CELL \(indexPath.row)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}


extension ViewController: DataModelDelegate {
    func updateCellCount(_ value: Int) {
        cellCount += value
    }
}

