//
//  DetailHistoryViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/16/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class DetailHistoryViewController: UIViewController {
    // This view is for the detail history screen that segued from history screen.
    
    @IBOutlet weak var tfType: UITextField!
    @IBOutlet weak var tfDateTime: UITextField!
    @IBOutlet weak var tfAmount: UITextField!
    
    var history: History!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Fill text fields with data from history object for viewing
        tfType.text = history.type
        tfDateTime.text = history.dateTime
        tfAmount.text = history.amount
    }
}
