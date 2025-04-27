//
//  Place.swift
//  MapSelfPractice
//
//  Created by BoMin Lee on 4/26/25.
//

import Foundation
import MapKit

struct Place: Identifiable, Hashable {
    let id = UUID()
    let mapItem: MKMapItem
}
