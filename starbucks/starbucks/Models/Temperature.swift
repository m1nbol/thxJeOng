//
//  Temperature.swift
//  starbucks
//
//  Created by BoMin Lee on 4/14/25.
//

import Foundation

enum TemperatureOption {
    case selectable(current: Temperature)
    case fixed(_ value: Temperature)
}

enum Temperature: String, CaseIterable {
    case hot = "HOT"
    case iced = "ICED"
}
