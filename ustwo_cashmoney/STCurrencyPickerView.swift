//
//  STCurrencyPickerView.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import UIKit

@IBDesignable

class STCurrencyPickerView: UIScrollView {
    

    func initialise() {
        
        let currencies = ["USD", "GBP", "EUR", "CAD", "JPY"];
        
        let CURRENCY_WIDTH:Int = 200

        for (var i = 0; i < currencies.count; i++) {
            let currLabel = UILabel(frame: CGRectMake(CGFloat(i*CURRENCY_WIDTH), 0, CGFloat(CURRENCY_WIDTH), self.frame.height))
            
            currLabel.text = currencies[i]
            currLabel.textColor = UIColor.whiteColor()
            currLabel.font = UIFont.systemFontOfSize(56)
            
            self.addSubview(currLabel)
        }
        
        self.contentSize.width = CGFloat(currencies.count * CURRENCY_WIDTH);
        self.pagingEnabled = true;
        self.showsHorizontalScrollIndicator = false;
        self.contentOffset = CGPoint(x: 250, y: 0);
        
        self.setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialise()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initialise()
    }
    
}
