//
//  Password.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/15/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class Password
{
    // This class sets the password and performs the check that the input matches.
    
    var password: String {
        get {
            // Change this if you want to use a different password
            return "password"
        }
    }
    
    func checkPassword(_ input: String) -> Bool {
        return password == input
    }
}
