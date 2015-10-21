//
//  STCurrencyPickerView.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import UIKit

protocol STCurrencyPickerViewDelegate {
    func updatedCurrency(currency:String);
}

class STCurrencyPickerView: UIScrollView, UIScrollViewDelegate {
    
    let CURRENCY_WIDTH:Int = 150
    let currencies = ["USD", "GBP", "EUR", "CAD", "JPY"];
    var currencyDelegate : STCurrencyPickerViewDelegate?
    
    func initialise() {
        
        self.delegate = self;
        
        for (var i = 0; i < currencies.count; i++) {
            let currLabel = UILabel(frame: CGRectMake(CGFloat(i*CURRENCY_WIDTH), 0, CGFloat(CURRENCY_WIDTH), self.frame.height))
            
            currLabel.textAlignment = NSTextAlignment.Center
            currLabel.text = currencies[i]
            currLabel.textColor = UIColor.whiteColor()
            currLabel.font = UIFont.systemFontOfSize(56)
            
            self.addSubview(currLabel)
        }
        
        self.contentSize.width = CGFloat(currencies.count * CURRENCY_WIDTH);
        self.pagingEnabled = true;
        self.showsHorizontalScrollIndicator = false;
        self.clipsToBounds = false;
        
        self.setNeedsDisplay()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let width = scrollView.frame.size.width;
        let page = Int((scrollView.contentOffset.x + (0.5 * width)) / width);
        
        currencyDelegate?.updatedCurrency(currencies[page])     // Alert the delegates
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
