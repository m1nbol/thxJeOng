//
//  Date+.swift
//  starbucks
//
//  Created by BoMin Lee on 4/17/25.
//

import Foundation

extension Date {
    func formattedForReceipt() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
}
