//
//  Account.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class Account
{
    // This class stores the account balance and performs the deposit and withdraw operation
    
    var total: Double
    var balance: Double {
        get {
            return total
        }
    }
    
    init() {
        // Change this if you want to have a different starting balance
        total = 0.00
    }
    
    func deposit(_ moneyToDeposit: Double) {
        total += moneyToDeposit
    }
    
    func withdraw(_ moneyToWithdraw: Double) {
        total -= moneyToWithdraw
    }
    
    func depositOrWithdraw(_ money: Double, _ operation: String) {
        // Perform deposit or withdraw depending on chosen operation
        if operation == "Deposit" {
            deposit(money)
        } else {
            withdraw(money)
        }
    }
}
