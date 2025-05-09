//
//  StoreDataLoader.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation

class StoreDataLoader {
    
    static func loadStores() -> [Feature] {
        guard let url = Bundle.main.url(forResource: "starbucksStores_kr_2025", withExtension: "geojson") else {
            print("❌ GeoJSON 파일을 찾을 수 없습니다.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let featureCollection = try JSONDecoder().decode(FeatureCollection.self, from: data)
            return featureCollection.features
        } catch {
            print("❌ 디코딩 실패: \(error.localizedDescription)")
            return []
        }
    }
}
