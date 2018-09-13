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
        menuManager().setMenu(superview: view)
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
        if let numberStr = ui_numberInput.text,
            let numberInt = Int(numberStr),
            let numberDouble = Double(numberStr),
            let numberFormated = numberInt.formated() {
            print(numberDouble)
            print(numberFormated)
            if manager.isPrimeNumber(numberToTest: numberDouble) {
                ui_answerLabel.text = NSLocalizedString("itIs", comment: "")
                ui_answerDescriptionLabel.text = "\(numberFormated) \(NSLocalizedString("notPN", comment: ""))"
            } else {
                ui_answerLabel.text = NSLocalizedString("itIsNot", comment: "")
                if numberDouble == 1 {
                    ui_answerDescriptionLabel.text = ("\(numberFormated) \(NSLocalizedString("noDistinct", comment: ""))")
                } else {
                    ui_answerDescriptionLabel.text = "\(numberFormated) \(NSLocalizedString("otherDividers", comment: ""))"
                }
            }
        } else {
            ui_answerLabel.text = ""
            ui_answerDescriptionLabel.text = NSLocalizedString("incorrectNumber", comment: "")
        }
        UIView.transition(with: ui_answerView, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseIn], animations: {
            self.ui_answerView.isHidden = false
        }, completion: nil)
    }
    
    // TextField delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.transition(with: ui_answerView, duration: 0.15, options: [.transitionCrossDissolve,.curveEaseIn], animations: {
            self.ui_answerView.isHidden = true
        }, completion: nil)
        return true
    }
    
}

