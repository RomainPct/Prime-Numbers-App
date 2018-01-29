//
//  menuManager.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 25/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class menuManager {
    
    func setMenu(superview view:UIView) {
        addMenuButton(view: view)
        placeMenu(view: view)
    }
    
    private func addMenuButton(view : UIView) {
        let ui_menuButton = menuButton()
        ui_menuButton.setTitle("Menu", for: .normal)
        ui_menuButton.addTarget(menuManager.self, action: #selector(menuManager.menuButtonTaped), for: .touchUpInside)
        view.addSubview(ui_menuButton)
        ui_menuButton.translatesAutoresizingMaskIntoConstraints = false
        let cs_stickToLeft = NSLayoutConstraint(item: ui_menuButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let cs_spaceToBottom = NSLayoutConstraint(item: ui_menuButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -40)
        view.addConstraints([cs_stickToLeft,cs_spaceToBottom])
    }
    
    private func placeMenu(view:UIView) {
        let cs = view.constraints.filter{ $0.identifier == "menuLeading"}.first
        cs?.constant = -view.frame.width
    }
    
    @objc static func menuButtonTaped(_ button: menuButton) {
        if let view = button.superview {
            let cs = view.constraints.filter{ $0.identifier == "menuLeading"}.first
            if let cs = cs {
                let image = cs.constant == 0 ? nil : UIImage(named: "fleche")
//                let newImg = self.ResizeImage(image, targetSize: CGSize(width: 20, height: 20))
                button.setImage(image, for: .normal)
                cs.constant = cs.constant == 0 ? -view.frame.width : 0
                UIView.animate(withDuration: 0.3, delay: 0, options: [.beginFromCurrentState,.curveEaseIn], animations: {
                    view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
    
    @objc static func ResizeImage(_ image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard image != nil else {
            return nil
        }
        let size = image!.size
        
        let widthRatio  = targetSize.width  / image!.size.width
        let heightRatio = targetSize.height / image!.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image?.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
