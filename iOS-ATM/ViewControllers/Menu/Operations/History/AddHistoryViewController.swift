//
//  AddHistoryViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/16/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class AddHistoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // This view is for the add history screen that segued from history screen.
    
    var types: Types!
    var account: Account!
    var historyDB: HistoryDB!
    var statusMessage: StatusMessage!
    var formatter: Formatter!
    
    @IBOutlet weak var dpDate: UIDatePicker!
    @IBOutlet weak var tfAmount: UITextField!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var pvType: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusMessage = StatusMessage()
        formatter = Formatter()
        types = Types()
        self.pvType.delegate = self
        self.pvType.dataSource = self
        tfAmount.keyboardType = UIKeyboardType.decimalPad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Fill picker rows with types
        return types.typeInRow(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Store selected row in types object
        types.selectedRow
         = pvType.selectedRow(inComponent: 0)
    }
    
    @IBAction func checkAmount(_ sender: Any) {
        // Check format of input is correct.
        if let _ = Double(tfAmount.text!) {
            lbStatus.isHidden = true
        } else {
            statusMessage.errorMessage(lbStatus, "Incorrect amount format.")
        }
    }
    
    @IBAction func addTransaction(_ sender: Any) {
        // Format chosen date and time from date picker
        let date = formatter.dateTimeFormat(dpDate.date)
        // Store chosen type from picker in type variable
        let type = types.typeInRow(types.selectedRow)
        // If amount formatted correctly:
        if lbStatus.isHidden == true {
            switch type {
            case "Balance":
                // Amount must be empty
                if tfAmount.text == "" {
                    // Store transaction in history database and empty text field
                    historyDB.addTransaction(type, date, tfAmount.text!)
                    statusMessage.successMessage(lbStatus, "Transaction added.")
                    tfAmount.text = ""
                } else {
                    statusMessage.errorMessage(lbStatus, "Amount not needed.")
                }
            case "Withdraw", "Deposit":
                // Amount must be filled
                if tfAmount.text != "" {
                    // Format amount and store transaction in history database
                    let amount = formatter.moneyFormat(Double(tfAmount.text!)!)
                    historyDB.addTransaction(type, date, amount)
                    // Update account balance depending on if withdrawing or depositing and empty text field
                    account.depositOrWithdraw(Double(tfAmount.text!)!, type)
                    statusMessage.successMessage(lbStatus, "Transaction added.")
                    tfAmount.text = ""
                } else {
                    statusMessage.errorMessage(lbStatus, "Amount needed.")
                }
            default:
                statusMessage.errorMessage(lbStatus, "Balance, Withdraw or Deposit.")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Send account and history database data back to history screen
        if let historyVC = segue.destination as? HistoryTableViewController {
            historyVC.account = account
            historyVC.historyDB = historyDB
        }
    }
}
