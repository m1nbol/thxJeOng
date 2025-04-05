//
//  CoffeeDetailModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

enum CoffeeTemperature: String, CaseIterable {
    case hot = "HOT"
    case cold = "COLD"
}

struct CoffeeDetailModel: Identifiable {
    let id = UUID()
    let image: Image
    let nameKorean: String
    let nameEnglish: String
    let description: String
    let price: Int
    let temperature: [CoffeeTemperature]
}
