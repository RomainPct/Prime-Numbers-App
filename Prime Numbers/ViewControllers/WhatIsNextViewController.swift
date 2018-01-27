//
//  WhatIsNextViewController.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 19/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class WhatIsNextViewController: UIViewController, UITextFieldDelegate {

    let manager = primeNumbersManager()
    
    @IBOutlet weak var ui_numberInput: input!
    @IBOutlet weak var ui_answerLabel: UILabel!
    @IBOutlet weak var ui_answerDescriptionLabel: UILabel!
    @IBOutlet weak var ui_answerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ui_numberInput.delegate = self
        
        menuManager().setMenu(superview: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whatIsNext(_ sender: Any) {
        hideKeyboard()
        if let numberString = ui_numberInput.text,
            let numberInt = Int(numberString) {
            let nextNumber = manager.searchNextPrimeNumber(after: numberInt)
            ui_answerLabel.text = "\(nextNumber)"
            ui_answerDescriptionLabel.text = "is the first prime number after \(numberString)."
            UIView.transition(with: ui_answerView, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseIn], animations: {
                self.ui_answerView.isHidden = false
            }, completion: nil)
        } else {
            print("Data n'est pas un nombre correct")
        }
    }
    
//    Cacher le clavier
    @IBAction func viewTaped(_ sender: Any) {
        hideKeyboard()
    }
    func hideKeyboard() {
        if ui_numberInput.isFirstResponder {
            ui_numberInput.resignFirstResponder()
        }
    }
    
// TextField delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.transition(with: ui_answerView, duration: 0.15, options: [.transitionCrossDissolve,.curveEaseIn], animations: {
            self.ui_answerView.isHidden = true
        }, completion: nil)
        return true
    }

}
