//
//  OrderViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/27/25.
//

import Foundation
import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var menuList: [OrderMenuModel] = []
    
    init() {
        menuList = [
            OrderMenuModel(id: 0, name: "추천", nameEnglish: "Recommend", image: Image(.espressoConpannaCircle)),
            OrderMenuModel(id: 1, name: "아이스 카페 아메리카노", nameEnglish: "Iced Caffe Americano", image: Image(.americanoIcedCircle)),
            OrderMenuModel(id: 2, name: "카푸치노", nameEnglish: "Cappuccino", image: Image(.cappuccinoCircle)),
            OrderMenuModel(id: 3, name: "아이스 카푸치노", nameEnglish: "Iced Cappuccino", image: Image(.cappuccinoIcedCircle)),
            OrderMenuModel(id: 4, name: "카라멜 마키아또", nameEnglish: "Caramel Macchiato", image: Image(.caramelMacchiatoCircle)),
            OrderMenuModel(id: 5, name: "아이스 카라멜 마키아또", nameEnglish: "Iced Caramel Macchiato", image: Image(.caramelMacchiatoIcedCircle)),
            OrderMenuModel(id: 6, name: "아포가토/기타", nameEnglish: "Affogato / Others", image: Image(.affogatoCircle)),
            OrderMenuModel(id: 7, name: "럼 샷 코르타도", nameEnglish: "Rum Shot Cortado", image: Image(.rumCortadoCircle)),
            OrderMenuModel(id: 8, name: "라벤더 카페 브레베", nameEnglish: "Lavender Caffe Breve", image: Image(.lavenderBreveCircle)),
            OrderMenuModel(id: 9, name: "병음료", nameEnglish: "RTD", image: Image(.rtdCircle))
        ]
    }
}
