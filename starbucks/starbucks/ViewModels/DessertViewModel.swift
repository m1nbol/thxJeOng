//
//  DessertViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var dessertList: [MenuModel] = []
    
    init() {
        dessertList = [
            MenuModel(name: "너티 크루아상", image: Image(.nuttyCroissant)),
            MenuModel(name: "매콤 소시지 불고기", image: Image(.spicySausage)),
            MenuModel(name: "미니 리프 파이", image: Image(.miniLeafPie)),
            MenuModel(name: "뺑 오 쇼콜라", image: Image(.painAuChocolat)),
            MenuModel(name: "소시지&올리브 파이", image: Image(.sausageOlivePie))
        ]
    }
}
