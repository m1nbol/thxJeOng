//
//  ShopViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/14/25.
//

import Foundation
import SwiftUI

class ShopViewModel: ObservableObject {
    @Published var bannerImageList: [BannerImage] = []
    
    init() {
        bannerImageList = [
            BannerImage(image: Image(.firstBanner)),
            BannerImage(image: Image(.secondBanner)),
            BannerImage(image: Image(.thirdBanner))
        ]
    }
}

struct BannerImage: Identifiable {
    let id = UUID()
    let image: Image
}
