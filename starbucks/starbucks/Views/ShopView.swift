//
//  ShopView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/8/25.
//

import SwiftUI

struct ShopView: View {
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        VStack {
            Text("this is shop view")
                .foregroundStyle(.blue01)
                .font(.mainTextBold20)
            Image(systemName: "basket.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.blue01)
                .frame(width: 100, height: 100)
        }
        
    }
    
    private var topBanner: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 28) {
                ForEach(viewModel.bannerImageList) { bannerImage in
                    bannerImage.image
                        .resizable()
                }
            }
        }
    }
}

#Preview {
    ShopView()
}
