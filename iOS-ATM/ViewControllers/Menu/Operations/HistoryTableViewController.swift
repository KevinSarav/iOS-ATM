//
//  HistoryTableTableViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/16/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    // This view is for the history screen.
    // Can segue to add history and detail history screens.
    
    var password: Password!
    var account: Account!
    var historyDB: HistoryDB!
    var history: History!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyDB.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fill table rows with date-time data from history database
        let historyIdentifier = "HistoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: historyIdentifier, for: indexPath)
        let historyCell = historyDB.dateTimeAtIndex(indexPath.row)
        cell.textLabel!.text = historyCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Transactions"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id{
            // If plus button pressed:
            case "HistoryToAdd":
                // Send account and history database data to add history screen
                if let addVC = segue.destination as? AddHistoryViewController {
                    addVC.account = account
                    addVC.historyDB = historyDB
                }
            // If a cell is pressed:
            case "HistoryToDetails":
                // Send history data from selected row to detail history screen
                if let detailVC = segue.destination as? DetailHistoryViewController {
                    let selectedRow = self.tableView.indexPathForSelectedRow?.row
                    history = historyDB.historyAtIndex(selectedRow!)
                    detailVC.history = history
                }
            // If home button pressed:
            case "HistoryToHome":
                // Create password object and send to password screen.
                if let passwordVC = segue.destination as? PasswordViewController {
                    password = Password()
                    passwordVC.password = password
                }
            default: break
            }
        }
    }
}
