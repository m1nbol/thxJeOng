//
//  Marker.swift
//  MapSelfPractice
//
//  Created by BoMin Lee on 4/23/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
