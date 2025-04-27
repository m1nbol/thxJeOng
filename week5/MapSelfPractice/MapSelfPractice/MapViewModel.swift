//
//  MapViewModel.swift
//  MapSelfPractice
//
//  Created by BoMin Lee on 4/23/25.
//

import SwiftUI
import MapKit
import Observation

@Observable
final class MapViewModel {
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var didEnterGeofence: Bool = false
    
    var searchResults: [Place] = []
    
    // 지역
    var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // 마커
    var makers: [Marker] = [
        .init(coordinate: .init(latitude: 36.013606, longitude: 129.326297), title: "포항공과대학교 C5"),
        .init(coordinate: .init(latitude: 36.017372, longitude: 129.347266), title: "맥도날드 포항남부DT점")
//        .init(coordinate: .init(latitude: 37.504675, longitude: 126.957034), title: "중앙대학교"),
//        .init(coordinate: .init(latitude: 37.529598, longitude: 126.963946), title: "용산 CGV")
    ]

//    let geofenceCoordinate = CLLocationCoordinate2D(latitude: 36.013024, longitude: 129.326010)
//    let geofenceRadius: CLLocationDistance = 100
//    let geofenceIdentifier = "포항공대"
    
    let geofenceCoordinate = CLLocationCoordinate2D(latitude: 36.009547, longitude: 129.335652)
    let geofenceRadius: CLLocationDistance = 200
    let geofenceIdentifier = "효자교회"
    
    init() {
        LocationManager.shared.startMonitoringGeofence(center: geofenceCoordinate, radius: geofenceRadius, identifier: geofenceIdentifier)
    }
    
    func search(query: String, to locaation: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = .init(center: locaation.coordinate, span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let self, let mapItems = response?.mapItems else { return }
            
            DispatchQueue.main.async {
                self.searchResults = mapItems.map { Place(mapItem: $0) }
            }
        }
    }
}
