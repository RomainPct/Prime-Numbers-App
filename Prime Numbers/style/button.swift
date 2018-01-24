//
//  button.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 13/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class button: UIButton {

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
    }

}
