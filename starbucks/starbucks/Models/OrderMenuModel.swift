//
//  OrderMenuModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/29/25.
//

import Foundation
import SwiftUI

struct OrderMenuModel: Identifiable {
    var id: Int
    var name: String
    var nameEnglish: String
    var image: Image
    
    init(id: Int, name: String, nameEnglish: String, image: Image) {
        self.id = id
        self.name = name
        self.nameEnglish = nameEnglish
        self.image = image
    }
}

