//
//  SearchBetweenViewController.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 24/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class SearchBetweenViewController: UIViewController, UITableViewDataSource {

    let manager = primeNumbersManager()
    var resultTable:[Int] = []
    
    @IBOutlet weak var ui_firstNumberInput: input!
    @IBOutlet weak var ui_lastNumberInput: input!
    @IBOutlet weak var ui_resultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ui_resultTableView.dataSource = self
        
        menuManager().addMenuButton(view: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTaped(_ sender: Any) {
        resignAllFR()
    }
    
    @IBAction func launchResearch(_ sender: Any) {
        resignAllFR()
        if let firstInt = Double(ui_firstNumberInput.text ?? "0"),
            let lastInt = Double(ui_lastNumberInput.text ?? "100"),
            firstInt < lastInt {
            resultTable.removeAll()
            var numberToTest = firstInt
            while numberToTest <= lastInt {
                if manager.isPrimeNumber(numberToTest: numberToTest) {
                    resultTable.append(Int(numberToTest))
                }
                numberToTest += 1
            }
            showResultTable()
        } else {
            hideResultTable()
            print("Erreur")
        }
    }
    
    func showResultTable() {
        ui_resultTableView.reloadData()
        ui_resultTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        UIView.transition(with: ui_resultTableView, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseIn], animations: {
            self.ui_resultTableView.isHidden = false
        }, completion: nil)
    }
    
    func hideResultTable() {
        UIView.transition(with: ui_resultTableView, duration: 0.15, options: [.transitionCrossDissolve, .curveEaseIn], animations: {
            self.ui_resultTableView.isHidden = true
        }, completion: nil)
    }
    
    func resignAllFR() {
        ui_firstNumberInput.resignFirstResponder()
        ui_lastNumberInput.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ui_resultTableView.dequeueReusableCell(withIdentifier: "classicCell") as! UITableViewCell
        cell.textLabel?.text = "\(resultTable[indexPath.row])"
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
