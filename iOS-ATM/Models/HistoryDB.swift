//
//  History.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class HistoryDB
{
    // This class stores an array of history objects and adds transactions to it.
    
    var history: History!
    var transactions: [History]
    
    init() {
        transactions = Array<History>()
    }
    
    func addTransaction(_ type: String, _ dateTime: String, _ amount: String) {
        // Latest transactions appear in beginning of array
        history = History(type, dateTime, amount)
        transactions.insert(history, at: 0)
    }
    
    func dateTimeAtIndex(_ index: Int) -> String {
        return transactions[index].dateTime
    }
    
    func historyAtIndex(_ index: Int) -> History {
        return transactions[index]
    }
    
    func count() -> Int {
        return transactions.count
    }
}
