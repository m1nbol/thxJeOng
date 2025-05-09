//
//  MenuSegment.swift
//  starbucks
//
//  Created by BoMin Lee on 4/27/25.
//

import Foundation

enum MenuSegment: String, CaseIterable, Identifiable {
    case all = "전체 메뉴"
    case myMenu = "나만의 메뉴"
    case wholeCake = "홀케이크 예약"
    
    var id: String { rawValue }
}

enum MenuTypeSegment: String, CaseIterable, Identifiable {
    case drink = "음료"
    case food = "푸드"
    case product = "상품"
    
    var id: String { rawValue }
}
