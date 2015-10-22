//
//  STCurrencyPickerView.swift
//  ustwo_cashmoney
//
//  Created by Sam Turner on 20/10/2015.
//  Copyright © 2015 Sam Turner. All rights reserved.
//

import UIKit

protocol STCurrencyPickerViewDelegate {
    func updatedCurrency(currency:String);          // Called when a new currency is selected
}

class STCurrencyPickerView: UIScrollView, UIScrollViewDelegate {
    
    let CURRENCY_WIDTH:Int = 150
    let currencies = ["USD", "GBP", "EUR", "CAD", "JPY"];
    var currencyDelegate : STCurrencyPickerViewDelegate?            // An external delegate
    
    func initialise() {
        self.delegate = self;
        
        // Add the labels to the scroll view
        for (var i = 0; i < currencies.count; i++) {
            let currLabel = UILabel(frame: CGRectMake(CGFloat(i*CURRENCY_WIDTH), 0, CGFloat(CURRENCY_WIDTH), self.frame.height))
            
            currLabel.textAlignment = NSTextAlignment.Center
            currLabel.text = currencies[i]
            currLabel.textColor = UIColor(red:0.44, green:0.87, blue:0.55, alpha:1)
            currLabel.font = UIFont.systemFontOfSize(56)
            
            self.addSubview(currLabel)
        }
        
        // Set the right configuration values
        self.contentSize.width = CGFloat(currencies.count * CURRENCY_WIDTH);
        self.pagingEnabled = true;
        self.showsHorizontalScrollIndicator = false;
        self.clipsToBounds = false;
        
        self.setNeedsDisplay()          // Update the view
        updateLabelColorsWithPage(0);   // Make sure the first element is white
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let width = scrollView.frame.size.width;
        let page = Int((scrollView.contentOffset.x + (0.5 * width)) / width);
        
        updateLabelColorsWithPage(page)
        currencyDelegate?.updatedCurrency(currencies[page])     // Alert the delegates
    }
    //...
    
    func updateLabelColorsWithPage(page:Int) {
        for view in self.subviews {
            if (view.isMemberOfClass(UILabel)) {
                let lbl = view as! UILabel
                lbl.textColor = UIColor(red:0.44, green:0.87, blue:0.55, alpha:1)
            }
        }
        
        let lbl = self.subviews[page] as! UILabel
        lbl.textColor = UIColor.whiteColor()
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
