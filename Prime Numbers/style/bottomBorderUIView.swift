//
//  bottomBorderUIView.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 13/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class bottomBorderUIView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let startingPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let endPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: endPoint)
        path.lineWidth = 2
        
        tintColor.setStroke()
        path.stroke()
    }

}
