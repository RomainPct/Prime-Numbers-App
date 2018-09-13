//
//  Double_extension.swift
//  Prime Numbers
//
//  Created by Romain Penchenat on 09/06/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import Foundation

extension Int {
    func formated() -> String? {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        format.maximumFractionDigits = 0
        return format.string(from: NSNumber(value: self))
    }
}
