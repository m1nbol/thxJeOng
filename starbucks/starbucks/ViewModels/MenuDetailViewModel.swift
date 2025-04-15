//
//  MenuDetailViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/7/25.
//

import Foundation
import SwiftUI

class MenuDetailViewModel: ObservableObject {
    @Published var menuDetailList: [MenuDetailModel] = []
    
    init() {
        menuDetailList = [
            MenuDetailModel(id: 1, name: "에스프레소 콘파냐", nameEnglish: "Espresso Con Panna", description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: 4100, temperature: .hot, availableTemperatures: [.hot], image: Image(.conpanna)),
            MenuDetailModel(id: 2, name: "에스프레소 마끼아또", nameEnglish: "Espresso Macchiato", description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료", price: 3900, temperature: .iced, availableTemperatures: [.iced], image: Image(.macchiato)),
            MenuDetailModel(id: 3, name: "아이스 카페 아메리카노", nameEnglish: "Iced Caffe Americano", description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", price: 4700, temperature: .iced, availableTemperatures: [.hot, .iced], image: Image(.americanoCold)),
            MenuDetailModel(id: 4, name: "카페 아메리카노", nameEnglish: "Caffe Americano", description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피", price: 4700, temperature: .hot, availableTemperatures: [.hot, .iced], image: Image(.americanoHot)),
            MenuDetailModel(id: 5, name: "아이스 카라멜 마끼아또", nameEnglish: "Iced Caramel Macchiato", description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: 6100, temperature: .iced, availableTemperatures: [.hot, .iced], image: Image(.caramelCold)),
            MenuDetailModel(id: 6, name: "카라멜 마끼아또", nameEnglish: "Caramel Macchiato", description: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: 6100, temperature: .hot, availableTemperatures: [.hot, .iced], image: Image(.caramelHot))
        ]
    }
    
    func menu(withId id: Int = 0) -> MenuDetailModel {
        menuDetailList.first(where: { $0.id == id }) ?? MenuDetailModel(id: 0, name: "커피 정보 없음", nameEnglish: "Coffee Information Not Found", description: "커피 정보를 찾을 수 없습니다", price: 0, temperature: .hot, availableTemperatures: [.hot, .iced], image: Image(.conpanna))
    }
    
    func menu(withId id: Int = 0, selectedTemp: Temperature = .hot) -> MenuDetailModel {
        menuDetailList.first(where: { $0.id == id && $0.temperature == selectedTemp }) ?? MenuDetailModel(id: 0, name: "커피 정보 없음", nameEnglish: "Coffee Information Not Found", description: "커피 정보를 찾을 수 없습니다", price: 0, temperature: .hot, availableTemperatures: [.hot, .iced], image: Image(.conpanna))
    }
    
    func isOnlyTemperature(withId id: Int) -> Bool {
        if menuDetailList.first(where: { $0.id == id })?.temperature == .hot || menuDetailList.first(where: { $0.id == id })?.temperature == .iced {
            return true
        } else {
            return false
        }
    }
}
