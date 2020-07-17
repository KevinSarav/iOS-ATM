//
//  StatusMessage.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class StatusMessage
{
    // This class stores the functions for displaying error and success messages.
    
    func successMessage(_ label: UILabel, _ message: String) {
        label.backgroundColor = UIColor.green
        label.text = message
        label.isHidden = false
    }
    
    func errorMessage(_ label: UILabel, _ message: String) {
        label.backgroundColor = UIColor.red
        label.text = message
        label.isHidden = false
    }
}
