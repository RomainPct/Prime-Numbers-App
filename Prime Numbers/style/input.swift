//
//  input.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 13/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class input: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10
        
        self.layer.borderWidth = 2
        self.layer.borderColor = self.tintColor.cgColor
        
        let color = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 0.5)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedStringKey.foregroundColor : color])
    }

}
