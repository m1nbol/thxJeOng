//
//  ReceiptModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/16/25.
//

import Foundation
import SwiftData

@Model
class ReceiptModel {
//    @Attribute(.unique) var id = UUID()
    @Attribute(.externalStorage) var imageData: Data?
    
    var store: String
    var date: Date
    var totalPrice: Int
    
    init(store: String, date: Date, totalPrice: Int) {
        self.store = store
        self.date = date
        self.totalPrice = totalPrice
    }
}
