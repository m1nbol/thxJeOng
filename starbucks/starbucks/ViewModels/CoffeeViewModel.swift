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
            MenuModel(name: "에스프레소 콘파냐", image: Image(.espressoConpannaCircle)),
            MenuModel(name: "에스프레소 마키아또", image: Image(.espressoMacchiatoCircle)),
            MenuModel(name: "아이스 카페 아메리카노", image: Image(.americanoIcedCircle)),
            MenuModel(name: "카페 아메리카노", image: Image(.americanoCircle)),
            MenuModel(name: "아이스 카라멜 마키아또", image: Image(.caramelMacchiatoIcedCircle)),
            MenuModel(name: "카라멜 마키아또", image: Image(.caramelMacchiatoCircle))
        ]
    }
}
