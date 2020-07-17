//
//  MenuViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    // This view is for the main menu screen.
    // Can segue to deposit, withdraw, balance and history screens.
    
    var account: Account!
    var historyDB: HistoryDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        account = Account()
        historyDB = HistoryDB()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Send account and history database data to subsequent screens
        if let id = segue.identifier {
            switch id{
            // If deposit button pressed:
            case "MenuToDeposit":
                if let depositVC = segue.destination as? DepositViewController {
                    depositVC.account = account
                    depositVC.historyDB = historyDB
                }
            // If withdraw button pressed:
            case "MenuToWithdraw":
                if let withdrawVC = segue.destination as? WithdrawViewController {
                    withdrawVC.account = account
                    withdrawVC.historyDB = historyDB
                }
            // If balance button pressed:
            case "MenuToBalance":
                if let balanceVC = segue.destination as? BalanceViewController {
                    balanceVC.account = account
                    balanceVC.historyDB = historyDB
                }
            // If history button pressed:
            case "MenuToHistory":
                if let historyTVC = segue.destination as? HistoryTableViewController {
                    historyTVC.account = account
                    historyTVC.historyDB = historyDB
                }
            default: break
            }
        }
    }
}
