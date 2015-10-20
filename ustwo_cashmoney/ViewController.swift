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
        // If the text field is empty, append the dollar sign
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
    
    // MARK: HELPER FUNCTIONS
    
    /**
    Based on the input amount, calculate the output amount depending on the currency selected in the CurrencyPicker
    
    - parameter inputAmount: the amount in AUD to be converted
    - returns: the converted amount depending on the selected currency
    */
    func calculateOutputAmount(inputAmount:Float) -> Float {
        let currency = "USD";
        
        switch currency {
            case "USD":
                return inputAmount * STFixerCommunicator.sharedCommunicator.exchangeRates.USD!
            case "GBP":
                return inputAmount * STFixerCommunicator.sharedCommunicator.exchangeRates.GBP!
            case "CAD":
                return inputAmount * STFixerCommunicator.sharedCommunicator.exchangeRates.CAD!
            case "JPY":
                return inputAmount * STFixerCommunicator.sharedCommunicator.exchangeRates.JPY!
            case "EUR":
                return inputAmount * STFixerCommunicator.sharedCommunicator.exchangeRates.EUR!
            default:
                return inputAmount;
        }
    }
    
    //...
}

