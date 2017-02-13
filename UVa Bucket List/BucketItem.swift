//
//  BucketItem.swift
//  UVa Bucket List
//
//  Created by Haoyang Li on 2/11/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import Foundation

class BucketItem {
    var name: String
    var dateToComplete: String
    var isComplete: Bool
    
    init(name: String, date: String, isComplete: Bool) {
        self.name = name
        self.dateToComplete = date
        self.isComplete = isComplete
    }
}
