//
//  ViewController.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, STCurrencyPickerViewDelegate {

    @IBOutlet var amountInputField: UITextField!
    @IBOutlet var amountOutputField: UILabel!
    @IBOutlet var currencyPickerView: STCurrencyPickerView!
    
    var selectedCurrency = "USD"            // Default to USD
    var inputAmount:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPickerView.currencyDelegate = self;
        amountInputField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: STCurrencyPickerDelegate Functions
    func updatedCurrency(currency: String) {
        selectedCurrency = currency
        updateConvertedValue()
    }
    //...
    
    // MARK: UITextFieldDelegate Functions
    
    /**
    When the user begins editing make sure to append the dollar sign
    */
    func textFieldDidBeginEditing(textField: UITextField) {
        // If the text field is empty, append the dollar sign
        if (textField.text == "") {
            textField.text = "$";
        }
    }
    
    /**
    Make sure to close the keyboard when 'done' is tapped
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    // ...
    
    // MARK: IBACTIONS
    
    /**
    When the text field changes, update the value that is displayed at the bottom
    - parameter sender: sender
    */
    @IBAction func textFieldEditingDidChange(sender: AnyObject) {
        updateConvertedValue()
    }
    //...
    
    // MARK: HELPER FUNCTIONS
    
    /**
     Carry out the calculations and then update the text fields
    */
    func updateConvertedValue() {
        inputAmount = (amountInputField.text?.stringByReplacingOccurrencesOfString("$", withString: "").floatValue)!;          // Strip out $ so we can covert to a float
        let outputAmount = calculateOutputAmount(inputAmount, currency: selectedCurrency)
        let outputSymbol = calculateCurrencySymbol(selectedCurrency)
        
        amountOutputField.text = "\(outputSymbol) \(outputAmount)"
    }
    
    /**
    Based on the input amount, calculate the output amount depending on the currency selected in the CurrencyPicker
    
    - parameter inputAmount: the amount in AUD to be converted
    - returns: the converted amount depending on the selected currency
    */
    func calculateOutputAmount(inputAmount:Float, currency:String) -> Float {
        
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
    
    /**
    Calculates the correct current symbol based on the currency that is selected
    
    - returns: A string containing the correct currency symbol
    */
    func calculateCurrencySymbol(currency: String) -> String {
        switch currency {
        case "USD", "CAD":
            return "$"
        case "GBP":
            return "£"
        case "JPY":
            return "¥"
        case "EUR":
            return "€"
        default:
            return "$"
        }
    }
    
    //...
}

