//
//  Int+.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation

extension Int {
    var withComma: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
