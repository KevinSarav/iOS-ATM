//
//  BalanceViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    // This view is for the balance screen that segued from main menu.
    
    var account: Account!
    var historyDB: HistoryDB!
    var formatter: Formatter!

    @IBOutlet weak var lbBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Format current date and time to store  viewing balance activity to history database
        formatter = Formatter()
        let date = formatter.dateTimeFormat(Date())
        historyDB.addTransaction("Balance", date, "")
        // Set label equal to formatted account balance
        lbBalance.text = formatter.moneyFormat(account.balance)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Send history database data back to main menu
        if let menuVC = segue.destination as? MenuViewController {
            menuVC.historyDB = historyDB
        }
    }
}
