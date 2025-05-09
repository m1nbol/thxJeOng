//
//  StoreSegment.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation

enum StoreSegment: String, CaseIterable, Identifiable {
    case nearest = "가까운 매장"
    case frequent = "자주 가는 매장"
    
    var id: String { rawValue }
}

