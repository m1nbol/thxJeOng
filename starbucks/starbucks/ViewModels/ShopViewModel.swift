//
//  ShopViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/14/25.
//

import Foundation
import SwiftUI

class ShopViewModel: ObservableObject {
    @Published var bannerImageList: [BannerImage] = []
    @Published var productList: [MenuModel] = []
    @Published var bestItemsList: [MenuModel] = []
    
    init() {
        bannerImageList = [
            BannerImage(image: Image(.firstBanner)),
            BannerImage(image: Image(.secondBanner)),
            BannerImage(image: Image(.thirdBanner))
        ]
        productList = [
            MenuModel(id: 101, name: "텀블러", image: Image(.tumblr)),
            MenuModel(id: 102, name: "보온병", image: Image(.bottle)),
            MenuModel(id: 103, name: "머그/컵", image: Image(.mugAndCup)),
            MenuModel(id: 104, name: "라이프스타일", image: Image(.lifestyle)),
            MenuModel(id: 105, name: "선물세트", image: Image(.giftSet)),
            MenuModel(id: 106, name: "커피 용품", image: Image(.coffeeStuff))
        ]
        bestItemsList = [
            MenuModel(id: 201, name: "그린 사이렌 슬리브 머그 355ml", image: Image(.greenSleeveMug355)),
            MenuModel(id: 202, name: "그린 사이렌 클래식 머그 355ml", image: Image(.greenClassicMug355)),
            MenuModel(id: 203, name: "블랙 앤 골드 머그 473ml", image: Image(.blackAndGoldMug473)),
            MenuModel(id: 204, name: "블랙 링 머그 355ml", image: Image(.blackRingMug355)),
            MenuModel(id: 205, name: "리저브 골드 테일 머그 355ml", image: Image(.reserveGoldMug355)),
            MenuModel(id: 206, name: "사이렌 머그 앤 우드 소서", image: Image(.sirenMugWood)),
            MenuModel(id: 207, name: "북청사자놀음 데미머그 89ml", image: Image(.demiMug89)),
            MenuModel(id: 208, name: "서울 제주 데미머그 세트", image: Image(.seoulJejuDemiMugSet)),
        ]
    }
}

struct BannerImage: Identifiable {
    let id = UUID()
    let image: Image
}
