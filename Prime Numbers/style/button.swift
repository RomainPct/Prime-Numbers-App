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
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = superview?.tintColor.cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.87), for: .normal)
    }

}

class menuButton: button {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        self.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 40, bottom: 8, right: 40)
        self.semanticContentAttribute = .forceRightToLeft
        self.imageEdgeInsets = UIEdgeInsets.init(top: 4, left: 0, bottom: 0, right: -20)
    }
}
