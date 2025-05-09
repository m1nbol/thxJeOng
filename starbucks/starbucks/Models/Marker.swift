//
//  Marker.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
