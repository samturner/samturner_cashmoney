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

        amountInputField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate Functions
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField.text == "") {
            textField.text = "$";
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    // ...
    
    
    // MARK: IBACTIONS
    @IBAction func textFieldEditingDidChange(sender: AnyObject) {
        let inputAmount = amountInputField.text?.stringByReplacingOccurrencesOfString("$", withString: "").floatValue;          // Strip out $ so we can covert to a float
        let outputAmount = inputAmount! * STFixerCommunicator.sharedCommunicator.exchangeRates.USD!                             // Multiply the input value by whatever currency is selected
        
        amountOutputField.text = "$\(outputAmount)"
    }
    //...
}

