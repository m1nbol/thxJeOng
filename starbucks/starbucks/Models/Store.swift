//
//  Store.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation
import CoreLocation

//MARK: - 전체 GeoJSON 파일 구조
struct FeatureCollection: Codable {
    let type: String
    let name: String
    let features: [Feature]
}

// MARK: - 매장 하나(Feature)
struct Feature: Codable, Identifiable {
    var id: UUID { UUID() }  // SwiftUI ForEach 돌릴 때 필요

    let type: String
    let properties: Store
    let geometry: Geometry
}

struct StoreAndDistance: Identifiable {
    var id: UUID { UUID() }
    
    let store: Store
    let distance: Double
}

// MARK: - 매장 상세정보 (properties 안에 들어있는 데이터)
struct Store: Codable {
    let seq: String
    let sotreNm: String
    let address: String
    let telephone: String
    let category: String
    let ycoordinate: Double
    let xcoordinate: Double

    enum CodingKeys: String, CodingKey {
        case seq = "Seq"
        case sotreNm = "Sotre_nm"
        case address = "Address"
        case telephone = "Telephone"
        case category = "Category"
        case ycoordinate = "Ycoordinate"
        case xcoordinate = "Xcoordinate"
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - 매장 종류 구분용
enum StoreCategory: String {
    case reserve = "리저브 매장"
    case dt = "DT 매장"
    case normal = ""

    var iconName: String? {
        switch self {
        case .reserve:
            return "reserveIcon"
        case .dt:
            return "dtIcon"
        case .normal:
            return nil
        }
    }
}
