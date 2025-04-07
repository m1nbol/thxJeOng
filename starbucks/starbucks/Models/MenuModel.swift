//
//  MenuModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

struct MenuModel: Identifiable {
    var id: Int
    var name: String
    var image: Image
    
    init(id: Int, name: String, image: Image) {
        self.id = id
        self.name = name
        self.image = image
    }
}
