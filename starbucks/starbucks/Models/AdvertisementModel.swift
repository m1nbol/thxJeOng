//
//  AdvertisementModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

struct AdvertisementModel: Identifiable {
    var id: UUID = UUID()
    var image: Image
    var title: String
    var content: String
    
    init(id: UUID = UUID(), image: Image, title: String, content: String) {
        self.id = id
        self.image = image
        self.title = title
        self.content = content
    }
}
