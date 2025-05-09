//
//  StoreMapViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation
import MapKit
import Observation
import SwiftUI

@Observable
final class StoreMapViewModel {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var makers: [Marker] = []
    
//    var currentMapCenter: CLLocationCoordinate2D? {
//        if case let .region(region) = cameraPosition {
//            return region.center
//        }
//        if case let .camera(camera) = cameraPosition {
//            return camera.centerCoordinate
//        }
//        return nil
//    }
    
    func loadInitialStores() async {
        guard let userLocation = LocationManager.shared.currentLocation else { return }
        
        print("🔎 주변 매장 검색")
        makers = await searchStores(near: userLocation.coordinate)
    }
    
    func updateUserLocation(_ coordinate: CLLocationCoordinate2D) {
        // 위치가 바뀔 때마다 카메라 중심 업데이트
        cameraPosition = .region(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        )
    }
    
    func searchNearbyStores(center: CLLocationCoordinate2D?) {
        guard let center else { return }
        Task {
            makers = await searchStores(near: center)
        }
    }
    
    private func searchStores(near coordinate: CLLocationCoordinate2D) async -> [Marker] {
        let stores = StoreDataLoader.loadStores()
        
        let nearbyStores = stores
            .filter { feature in
                let storeLocation = CLLocation(latitude: feature.properties.ycoordinate, longitude: feature.properties.xcoordinate)
                let centerLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                let distance = centerLocation.distance(from: storeLocation) / 1000
                return distance <= 10
            }
        
        return nearbyStores.map { feature in
            Marker(coordinate: CLLocationCoordinate2D(latitude: feature.properties.ycoordinate, longitude: feature.properties.xcoordinate), title: feature.properties.sotreNm)
        }
    }
}
