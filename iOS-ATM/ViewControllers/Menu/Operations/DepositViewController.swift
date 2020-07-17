//
//  DepositViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController, UITextFieldDelegate {
    // This view is for the deposit screen that segued from main menu.
    
    var account: Account!
    var historyDB: HistoryDB!
    var statusMessage: StatusMessage!
    var formatter: Formatter!
    
    @IBOutlet weak var tfDeposit: UITextField!
    @IBOutlet weak var lbDepositStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusMessage = StatusMessage()
        formatter = Formatter()
        tfDeposit.keyboardType = UIKeyboardType.decimalPad
        self.tfDeposit.delegate = self
        tfDeposit.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDeposit.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    @IBAction func depositMoney(_ sender: Any) {
        // If input formatted correctly:
        if let depositAmount = Double(tfDeposit.text!) {
            // Format current date and time
            formatter = Formatter()
            let date = formatter.dateTimeFormat(Date())
            // Add deposit transaction to history database and update account balance
            historyDB.addTransaction("Deposit", date, formatter.moneyFormat(depositAmount))
            account.deposit(depositAmount)
            // Display success message in status label and empty text field
            statusMessage.successMessage(lbDepositStatus, "Amount deposited.")
            tfDeposit.text = ""
        } else {
            // Display error messasge in status label
            statusMessage.errorMessage(lbDepositStatus, "Invalid amount.")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Send account and history database data back to main menu
        if let menuVC = segue.destination as? MenuViewController {
            menuVC.account = account
            menuVC.historyDB = historyDB
        }
    }
}
