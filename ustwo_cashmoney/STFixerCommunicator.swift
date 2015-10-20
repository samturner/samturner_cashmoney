//
//  STFixerCommunicator.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import Foundation

class STFixerCommunicator {
    
    static let sharedCommunicator = STFixerCommunicator()               // STFixerCommunicator should be a singleton and can be reused across multiple views
    
    let exchangeRates = ExchangeRates();                                // Stores the relevant exchange rates
    
    func getLatestRates() {
        let url = NSURL(string: "http://api.fixer.io/latest?symbols=CAD,EUR,GBP,JPY,USD&base=AUD");         // Only get the rates that we actually require
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)       // Attempt to convert to a useful object
                self.exchangeRates.updateRates(json.objectForKey("rates")!)                                                         // Update the exchange rates
            } catch {
                print(error)
            }
        }
    }
    
    
}
