//
//  FruitModel.swift
//  practice3
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation


struct Fruit: Identifiable {
    let id = UUID()  // 고유한 ID 생성
    let name: String
    let emoji: String
}
