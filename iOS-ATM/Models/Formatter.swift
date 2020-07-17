//
//  Formatter.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class Formatter
{
    // This class stores the functions for formatting money and date
    
    func moneyFormat(_ money: Double) -> String {
        // Format double as money string
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return "$\(String(describing: numberFormatter.string(from: NSNumber(value: money))!))"
    }
    
    func dateTimeFormat(_ dateTime: Date) -> String {
        // Format date object as date-time string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return dateFormatter.string(from: dateTime)
    }
}
