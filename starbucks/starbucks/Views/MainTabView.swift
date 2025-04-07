//
//  MainTabView.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import SwiftUI

enum TabSelection {
    case home
    case pay
    case order
    case shop
    case other
}

struct MainTabView: View {
    @State private var selection: TabSelection = .home
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", image: self.selection == .home ? "homeSelected" : "home", value: .home) {
                HomeView()
            }
            
            Tab("Pay", image: self.selection == .pay ? "paySelected" : "pay", value: .pay) {
                PayView()
            }
            
            Tab("Order", image: self.selection == .order ? "orderSelected" : "order", value: .order) {
                OrderView()
            }
            
            Tab("Shop", image: self.selection == .shop ? "shopSelected" : "shop", value: .shop) {
                ShopView()
            }
            
            Tab("Other", image: self.selection == .other ? "otherSelected" : "other", value: .other) {
                OtherView()
            }
        }
        .tint(.green02)
    }
}

#Preview {
    MainTabView()
}

//struct MainTabView_Preview: PreviewProvider {
//    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
//    static var previews: some View {
//        ForEach(devices, id: \.self) { device in
//            MainTabView()
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
//}
