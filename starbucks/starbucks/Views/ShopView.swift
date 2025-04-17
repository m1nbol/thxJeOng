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
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                topBanner
                Spacer()
                productList
                Spacer()
                bestItems
            }
            .padding(.horizontal, 16)
        }
        .background(Color.white01)
        
    }
    
    private var topBanner: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 28) {
                    ForEach(viewModel.bannerImageList) { bannerImage in
                        bannerImage.image
    //                        .resizable()
                    }
                }
            }
        }
    }
    
    private var productList: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .font(.mainTextSemiBold22)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 17) {
                    ForEach(viewModel.productList) { product in
                        CircleImageCard(menu: product, fontSize: 13)
                            .frame(width: 80)
                    }
                }
            }
        }
    }
    
    private var bestItems: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .font(.mainTextSemiBold22)
            ScrollView(.horizontal, showsIndicators: false){ // MARK: JeOng: Section 써라.
                LazyHStack(alignment: .center) {
                    let columns = Array(repeating: GridItem(.flexible()), count: 2)
                    LazyVGrid(columns: columns, spacing: 65) {
                        ForEach(viewModel.bestItemsList[0...3]) { best in
                            SquareImageCard(menu: best)
                                .frame(width: 157)
                        }
                    }
                    LazyVGrid(columns: columns, spacing: 65) {
                        ForEach(viewModel.bestItemsList[4...7]) { best in
                            SquareImageCard(menu: best)
                                .frame(width: 157)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ShopView()
}
