//
//  MenuDetailModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/7/25.
//

import Foundation
import SwiftUI

struct MenuDetailModel: Identifiable {
    var id: Int
    var name: String
    var nameEnglish: String
    var description: String
    var price: Int
    var temperature: Temperature
    var image: Image
    
    init(id: Int, name: String, nameEnglish: String, description: String, price: Int, temperature: Temperature, image: Image) {
        self.id = id
        self.name = name
        self.nameEnglish = nameEnglish
        self.description = description
        self.price = price
        self.temperature = temperature
        self.image = image
    }
}

enum Temperature: String, CaseIterable {
    case hot
    case iced
    case onlyHot
    case onlyIced
}
