//
//  button.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 13/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class button: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//        self.frame = CGRect(x: rect.minX, y: rect.minY, width: rect.width + 80, height: 40)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }

}

class menuButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        self.layer.backgroundColor = superview?.tintColor.cgColor
        self.setTitleColor(UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.87), for: .normal)
        self.contentEdgeInsets = UIEdgeInsetsMake(8, 40, 8, 40)
    }
}
