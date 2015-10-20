//
//  StringExtensions.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import Foundation

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}