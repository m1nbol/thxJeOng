//
//  StoreListViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation
import CoreLocation
import Observation

@Observable
final class StoreListViewModel {
    
    var stores: [Feature] = []
    var nearbyStores: [StoreAndDistance] = [] // 가까운 매장만 따로 저장
    
    init() {
        loadStores()
    }
    
    private func loadStores() {
        self.stores = StoreDataLoader.loadStores()
    }
    
    /// 현재 위치를 기준으로 가까운 매장 정렬
    func sortStoresByDistance() {
        guard let userLocation = LocationManager.shared.currentLocation else {
            print("❌ 현재 위치를 가져올 수 없습니다.")
            return
        }
        
        print("✅ 현재 위치 가져옴")

        self.nearbyStores = stores
            .map { feature in
                let storeLocation = CLLocation(
                    latitude: feature.properties.ycoordinate,
                    longitude: feature.properties.xcoordinate
                )
                let distance = userLocation.distance(from: storeLocation) / 1000 // meter -> km
                return StoreAndDistance(store: feature.properties, distance: distance)
            }
            .filter { $0.distance <= 10 } // 10km 이내만
            .sorted { $0.distance < $1.distance } // 가까운 순 정렬
    }
}
