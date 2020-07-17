//
//  ViewController.swift
//  iOS-ATM
//
//  Created by Saravia, Kevin on 7/14/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
///Users/saraviak8835/Developer/iOS-ATM/iOS-ATM/Base.lproj/Main.storyboard

import UIKit

class PasswordViewController: UIViewController, UITextFieldDelegate {
    // This view is for the login screen.
    // Segues to main menu screen.
    
    var password: Password!

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbPasswordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // If a Password object does not exist already:
        if password == nil {
            password = Password()
        } else {
            // If Password object pre-exists from history screen segue:
            // Pre-fill password text field with correct password
            tfPassword.text = password.password
        }
        self.tfPassword.delegate = self
        tfPassword.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfPassword.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Check password in text field correct before going to main menu screen.
        // If not, un-hide error message
        let inputMatchesPassword = password.checkPassword(tfPassword.text!)
        lbPasswordError.isHidden = inputMatchesPassword
        return inputMatchesPassword
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Empty text field when moving to main menu screen
        tfPassword.text = ""
    }
}

