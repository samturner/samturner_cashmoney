//
//  ExchangeRates.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import Foundation

class ExchangeRates: NSObject {
    
    private(set) var CAD:Float?
    private(set) var EUR:Float?
    private(set) var GBP:Float?
    private(set) var JPY:Float?
    private(set) var USD:Float?
    
    /**
    Extract the values from the data recieved from Fixer
    
    - parameter data: An object that represents a JSON object converted to a dictionary
    */
    func updateRates(data: AnyObject?) {
        CAD = data?.objectForKey("CAD") as? Float
        EUR = data?.objectForKey("EUR") as? Float
        GBP = data?.objectForKey("GBP") as? Float
        JPY = data?.objectForKey("JPY") as? Float
        USD = data?.objectForKey("USD") as? Float
    }

    // FOR DEBUG
    func printRates() {
        print("CAD: \(CAD), EUR: \(EUR), GBP: \(GBP), JPY: \(JPY), USD:\(USD)")
    }
    
}
