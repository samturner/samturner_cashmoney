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


}

