//
//  SearchViewController.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 19/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource {

    let manager = primeNumbersManager()
    
    var isSearching = false
    var primeNumbers:[Int] = []
    
    @IBOutlet weak var ui_primeNumbersTable: UITableView!
    @IBOutlet weak var ui_searchButton: button!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ui_primeNumbersTable.dataSource = self
        
        menuManager().setMenu(superview: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    Lancer la recherche
    @IBAction func researchButtonTapped(_ sender: Any) {
        isSearching = !isSearching
        if !isSearching {
            ui_searchButton.setTitle(NSLocalizedString("button1", comment: ""), for: .normal)
        } else {
            ui_searchButton.setTitle(NSLocalizedString("button2", comment: ""), for: .normal)
            searchPrimeNumbers()
        }
    }
    
    func searchPrimeNumbers() {
        let background = DispatchQueue(label: "research", qos: .userInitiated)
        background.async {
            var lastPrimeNumber = self.primeNumbers.last ?? 0
            while self.isSearching {
                lastPrimeNumber = self.manager.searchNextPrimeNumber(after: lastPrimeNumber)
                self.newValue(number: lastPrimeNumber)
                usleep( 5000 + UInt32(lastPrimeNumber / 10))
            }
        }
    }
    
    private func newValue(number:Int){
        DispatchQueue.main.async {
            self.primeNumbers.append(number)
            self.ui_primeNumbersTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
    }
    
//    TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primeNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ui_primeNumbersTable.dequeueReusableCell(withIdentifier: "classicCell") as! UITableViewCell
        cell.textLabel?.text = "\(primeNumbers[primeNumbers.count - indexPath.row - 1].formated()!)"
        return cell
    }
    
}
