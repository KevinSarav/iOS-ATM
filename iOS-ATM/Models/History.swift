//
//  History.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/16/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class History
{
    // This class represents a history object containing 3 strings.
    var type: String
    var dateTime: String
    var amount: String
    
    init(_ type: String, _ dateTime: String, _ amount: String) {
        self.type = type
        self.dateTime = dateTime
        self.amount = amount
    }
}
