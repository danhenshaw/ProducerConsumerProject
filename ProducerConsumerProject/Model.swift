//
//  Model.swift
//  ProducerConsumerProject
//
//  Created by Daniel Henshaw on 2/3/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import Foundation

// DataModel has two types (Consumer or Producer) and depending on the typee set, the Model will be initialised with either a 3 second timer to add 1 to cellCount in ViewController or a 4 second timer to minus 1 from cellCount.

enum DataType {
    case producer, consumer
}

protocol DataModelDelegate: class {
    func updateCellCount(_ value: Int)
}

class DataModel {
    
    let dataType: DataType
    var timer: Timer
    
    weak var delegate: DataModelDelegate?
    
    init(dataType: DataType) {
        self.dataType = dataType
        timer = Timer()
        
        if dataType == .producer {
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    deinit {
        timer.invalidate()
    }
    
    @objc func fireTimer() {
        if dataType == .producer {
            delegate?.updateCellCount(1)
        } else {
            delegate?.updateCellCount(-1)
        }
    }
    
    
}
