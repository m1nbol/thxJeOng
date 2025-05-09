//
//  GeocodingManager.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation
import CoreLocation

@Observable
final class GeocodingManager {
    
    static let shared = GeocodingManager()
    private let geocoder = CLGeocoder()

    private init() {}
    
    /// 위도, 경도 → 주소 (역지오코딩)
    func reverseGeocode(latitude: Double, longitude: Double) async -> String? {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            if let placemark = placemarks.first {
                let addressComponents = [
                    placemark.administrativeArea, // 시/도
                    placemark.locality,           // 시/군/구
                    placemark.subLocality,        // 동/읍/면
                    placemark.thoroughfare        // 도로명
                ]
                let address = addressComponents.compactMap { $0 }.joined(separator: " ")
                return address
            }
        } catch {
            print("역지오코딩 에러: \(error.localizedDescription)")
        }
        return nil
    }
    
    /// 주소 → 위도, 경도 (지 오코딩)
    func geocode(address: String) async -> CLLocationCoordinate2D? {
        do {
            let placemarks = try await geocoder.geocodeAddressString(address)
            if let location = placemarks.first?.location {
                return location.coordinate
            }
        } catch {
            print("지오코딩 에러: \(error.localizedDescription)")
        }
        return nil
    }
}
