//
//  ContentView.swift
//  MapSelfPractice
//
//  Created by BoMin Lee on 4/23/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    private var locationManager = LocationManager()
    
    var body: some View {
//        Map(initialPosition: .region(locationManager.region))
        VStack {
            Text("Hello")
        }
    }
}

#Preview {
    ContentView()
}
