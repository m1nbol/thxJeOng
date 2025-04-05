//
//  AdvertisementViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

class AdvertisementViewModel: ObservableObject {
    @Published var advertisementList: [AdvertisementModel] = []
    
    init() {
        advertisementList = [
            AdvertisementModel(image: Image(.whatsNewFirst), title: "25년 3월 일회용컵 없는 날 캠페인", content: "매월 10일은 일회용컵 없는 날! 스타벅스 에코매장에서 개인컵 및 다회용컵을 이용하세요."),
            AdvertisementModel(image: Image(.whatsNewSecond), title: "스타벅스 ㅇㅇㅇ점을 찾습니다", content: "스타벅스 커뮤니티 스토어 파트너를 운영할 기관을 공모합니다."),
            AdvertisementModel(image: Image(.whatsNewThird), title: "2월 8일, 리저브 스프링 신규 커피 출시", content: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
        ]
    }
}
