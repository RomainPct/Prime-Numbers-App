//
//  findPrimeNumber.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 10/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import Foundation

class primeNumbersManager {
    
    func searchNextPrimeNumber(after number:Int) -> Int {
        var nextPrimeNumber:Int?
        var numberToTest = number + 1
        while nextPrimeNumber == nil {
            if self.isPrimeNumber(numberToTest: Double(numberToTest)) {
                nextPrimeNumber = numberToTest
            } else {
                numberToTest += 1
            }
        }
        return nextPrimeNumber!
    }
    
    func isPrimeNumber(numberToTest:Double) -> Bool {
        guard numberToTest > 1 else {
            return false
        }
        var isPrimeNumber = true
        var divider:Double = 2;
        while Double(divider) <= sqrt(numberToTest) && isPrimeNumber  {
            let calcul = numberToTest / divider
            if floor(calcul) == calcul {
                isPrimeNumber = false
            }
            divider = divider + 1
        }
        return isPrimeNumber
    }
    
}
