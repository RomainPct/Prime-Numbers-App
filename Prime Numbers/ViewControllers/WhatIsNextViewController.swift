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
        if let numberStr = ui_numberInput.text,
            let numberInt = Int(numberStr),
            let numberFormated = numberInt.formated() {
            let nextNumber = manager.searchNextPrimeNumber(after: numberInt)
            ui_answerLabel.text = "\(nextNumber.formated()!)"
            ui_answerDescriptionLabel.text = "\(NSLocalizedString("first", comment: "")) \(numberFormated)."
        } else {
            ui_answerLabel.text = ""
            ui_answerDescriptionLabel.text = NSLocalizedString("incorrectNumber", comment: "")
        }
        UIView.transition(with: ui_answerView, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseIn], animations: {
            self.ui_answerView.isHidden = false
        }, completion: nil)
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
