//
//  ViewController.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var amountInputField: UITextField!
    @IBOutlet var amountOutputField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        STFixerCommunicator.sharedCommunicator.getLatestRates();            // Get the latest rates from fixer
        
        amountInputField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: UITextFieldDelegate Functions
    func textFieldDidBeginEditing(textField: UITextField) {
        print("USER BEGAN EDITING")
        textField.text = "$"                // Make sure the $ is shown at the front of the text
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("USER TYPED SOMETHING")
        
        // TODO: Calculate the new value based on the exchange rate
        
        STFixerCommunicator.sharedCommunicator.exchangeRates.printRates()       // Print the exchange rates
        
        
        // Just assuming converting to USD to for nows
        
        return true;
    }
    // ...
}

