//
//  ViewController.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 10/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class IsItViewController: UIViewController, UITextFieldDelegate {
    
    let manager = primeNumbersManager()
    
    @IBOutlet weak var ui_numberInput: input!
    @IBOutlet weak var ui_answerView: UIView!
    @IBOutlet weak var ui_answerLabel: UILabel!
    @IBOutlet weak var ui_answerDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ui_numberInput.delegate = self
        
        menuManager().addMenuButton(view: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func viewTaped(_ sender: Any) {
        hideKeyboard()
    }
    
    func hideKeyboard() {
        if ui_numberInput.isFirstResponder {
            ui_numberInput.resignFirstResponder()
        }
    }
    
    @IBAction func isItAction(_ sender: Any) {
        hideKeyboard()
        if let numberString = ui_numberInput.text,
            let numberDouble = Double(numberString) {
            if manager.isPrimeNumber(numberToTest: numberDouble) {
                ui_answerLabel.text = "It is !"
                ui_answerDescriptionLabel.text = "\(numberString) haven’t any dividers except itself and 1."
            } else {
                ui_answerLabel.text = "It is not !"
                if numberDouble == 1 {
                    ui_answerDescriptionLabel.text = ("\(numberString) hasen't two distinct positive integer divisors")
                } else {
                    ui_answerDescriptionLabel.text = "\(numberString) has other dividers than itself and 1."
                }
            }
            UIView.transition(with: ui_answerView, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseIn], animations: {
                self.ui_answerView.isHidden = false
            }, completion: nil)
        } else {
            print("Data n'est pas un nombre correct")
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

