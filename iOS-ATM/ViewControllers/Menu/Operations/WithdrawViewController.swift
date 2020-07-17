//
//  WithdrawViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController, UITextFieldDelegate {
    // This view is for the withdraw screen that segued from main menu.
    // Similar to deposit view controller. View comments there for clarification.
    
    var account: Account!
    var historyDB: HistoryDB!
    var statusMessage: StatusMessage!
    var formatter: Formatter!
    
    @IBOutlet weak var tfWithdraw: UITextField!
    @IBOutlet weak var lbWithdrawStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusMessage = StatusMessage()
        formatter = Formatter()
        tfWithdraw.keyboardType = UIKeyboardType.decimalPad
        self.tfWithdraw.delegate = self
        tfWithdraw.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfWithdraw.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    @IBAction func withdrawMoney(_ sender: Any) {
        if let withdrawAmount = Double(tfWithdraw.text!) {
            // If withdrawing money doesn't lead to negative balance:
            if withdrawAmount < account.balance {
                formatter = Formatter()
                let date = formatter.dateTimeFormat(Date())
                historyDB.addTransaction("Withdraw", date, formatter.moneyFormat(withdrawAmount))
                account.withdraw(withdrawAmount)
                statusMessage.successMessage(lbWithdrawStatus, "Amount withdrawn.")
                tfWithdraw.text = ""
            } else {
                statusMessage.errorMessage(lbWithdrawStatus, "No negative balance.")
            }
        } else {
            statusMessage.errorMessage(lbWithdrawStatus, "Invalid amount.")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let menuVC = segue.destination as? MenuViewController {
            menuVC.account = account
            menuVC.historyDB = historyDB
        }
    }
}
