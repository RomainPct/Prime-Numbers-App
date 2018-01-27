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
                cs.constant = cs.constant == 0 ? -view.frame.width : 0
                UIView.animate(withDuration: 0.3, delay: 0, options: [.beginFromCurrentState,.curveEaseIn], animations: {
                    view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
    
}
