//
//  menuManager.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 25/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class menuManager {
    
    func addMenuButton(view : UIView) {
        let ui_menuButton = menuButton()
        ui_menuButton.setTitle("Menu", for: .normal)
        view.addSubview(ui_menuButton)
        ui_menuButton.translatesAutoresizingMaskIntoConstraints = false
        let cs_stickToLeft = NSLayoutConstraint(item: ui_menuButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let cs_spaceToBottom = NSLayoutConstraint(item: ui_menuButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -40)
        view.addConstraints([cs_stickToLeft,cs_spaceToBottom])
    }
    
}
