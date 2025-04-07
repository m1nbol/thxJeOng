//
//  CoffeeViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

class CoffeeViewModel: ObservableObject {
    @Published var coffeeList: [MenuModel] = []
    
    init() {
        coffeeList = [
            MenuModel(id: 1, name: "에스프레소 콘파냐", image: Image(.espressoConpannaCircle)),
            MenuModel(id: 2, name: "에스프레소 마끼아또", image: Image(.espressoMacchiatoCircle)),
            MenuModel(id: 3, name: "아이스 카페 아메리카노", image: Image(.americanoIcedCircle)),
            MenuModel(id: 4, name: "카페 아메리카노", image: Image(.americanoCircle)),
            MenuModel(id: 5, name: "아이스 카라멜 마끼아또", image: Image(.caramelMacchiatoIcedCircle)),
            MenuModel(id: 6, name: "카라멜 마끼아또", image: Image(.caramelMacchiatoCircle))
        ]
    }
}
