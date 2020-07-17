//
//  Types.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/17/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class Types
{
    // This class contains the possible types for the picker in add history screen and stores the selected row from the picker
    
    var array: Array<String>
    var selectedRow: Int
    
    init() {
        array = ["Deposit", "Withdraw", "Balance"]
        selectedRow = 0
    }
    
    func typeInRow(_ row: Int) -> String {
        return array[row]
    }
    
    func count() -> Int {
        return array.count
    }
}
