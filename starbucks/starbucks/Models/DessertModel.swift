//
//  DessertModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

struct DessertModel: Identifiable {
    var id: UUID
    var name: String
    var image: Image
    
    init(id: UUID = UUID(), name: String, image: Image) {
        self.id = id
        self.name = name
        self.image = image
    }
}
