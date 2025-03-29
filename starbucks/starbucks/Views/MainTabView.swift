//
//  MainTabView.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Others", systemImage: "person", value: 0) {
                OthersView()
            }
        }
    }
}

struct MainTabView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            MainTabView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
