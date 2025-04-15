//
//  HomeView.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("username") var username: String?
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var coffeViewModel = CoffeeViewModel()
    @StateObject private var adViewModel = AdvertisementViewModel()
    @StateObject private var dessertViewModel = DessertViewModel()
    
    @State private var selectedMenuId: Int = 0
    @State private var showDetail = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                topBanner
                    .frame(height: 260)
                
                VStack(spacing: 15) {
                    adBanner
                    recommendedMenu
                    eventBanner
                    serviceSubscribeBanner
                    newsBanner
                    secondAdBanner
                    dessertMenu
                    bottomEventBanner
                }
                .padding(.horizontal, 10)
                
                
            }
            .ignoresSafeArea(edges: .top)
        }
    }
    
    private var topBanner: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image(.topRabbitImg)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    VStack(alignment: .leading, spacing: 29) {
                        Spacer()
                        Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                            .font(.mainTextLight20)
                            .kerning(0.1)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(homeViewModel.homeModel.maxStarCount-homeViewModel.homeModel.starCount)★ until next Reward")
                                .font(.mainTextSemiBold16)
                                .foregroundStyle(.brown02)
                            progressBar
                                .frame(height: 10)
                        }
                        
                    }
                    .padding(.leading, 28.16)
                    
                    VStack(alignment: .trailing, spacing: 5) {
                        Spacer()
                        HStack {
                            Text("내용보기")
                                .font(.mainTextRegular13)
                                .foregroundStyle(.gray06)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.gray06)
                        }
                        .frame(width: 67, height: 20, alignment: .center)
                        
                        HStack {
                            Text("\(homeViewModel.homeModel.starCount)")
                                .font(.mainTextSemiBold38)
                            Text("/")
                                .font(.mainTextLight24)
                                .foregroundStyle(.gray00)
                            Text("\(homeViewModel.homeModel.maxStarCount)")
                                .font(.mainTextSemiBold24)
                                .foregroundStyle(.brown02)
                            +
                            Text("★")
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.brown02)
                        }
                        .padding(.trailing, 30)
                        
                    }
                    .padding(.trailing, 11)
                }
            }
            .padding(.bottom, 30)
        }
    }
    
    private var progressBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: geometry.size.width * 0.9, height: 8)
                    .foregroundColor(Color.gray07)
                Capsule()
                    .frame(width: geometry.size.width * 0.9 * homeViewModel.homeModel.starPercentage, height: 8)
                    .foregroundColor(.brown02)
            }
        }
    }
    
    private var adBanner: some View {
        Image(.adBanner)
            .resizable()
            .scaledToFit()
            
    }
    
    private var recommendedMenu: some View {
        VStack {
            HStack {
                Text(homeViewModel.displayName)
                    .foregroundStyle(.brown01)
                +
                Text("님을 위한 추천 메뉴")
                Spacer()
            }
            .font(.mainTextLight20)
            .padding(.leading, 10)
            
            ZStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(coffeViewModel.coffeeList) { coffee in
                            
                            CircleImageCard(menu: coffee, fontSize: 14)
                                .onTapGesture { selectedMenuId = coffee.id
                                    showDetail = true
                                }
                                .frame(width: 130)
                        }
                    }
                    .navigationDestination(isPresented: $showDetail) {
                        CoffeeDetailView(id: selectedMenuId)
                    }
                }
                
                
                
                // 자연스럽게 보이기 위해 그라데이션 추가
                HStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 5)
                    Spacer()
                }
                HStack {
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0), Color.white]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 5)
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    private var eventBanner: some View {
        Image(.eventBanner)
            .resizable()
            .scaledToFit()
    }
    
    private var serviceSubscribeBanner: some View {
        Image(.serviceSubscribeBanner)
            .resizable()
            .scaledToFit()
    }
    
    private var newsBanner: some View {
        VStack(alignment: .leading) {
            Text("What's New")
                .font(.mainTextLight20)
                .foregroundStyle(.black03)
                .frame(alignment: .leading)
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 14) {
                        ForEach(adViewModel.advertisementList) { ad in
                            WhatsNewCard(ad: ad)
                        }
                    }
                }
                HStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 5)
                    Spacer()
                }
                HStack {
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0), Color.white]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 5)
                }
            }
        }
        
    }
    
    private var secondAdBanner: some View {
        VStack(spacing: 10) {
            Image(.mugcupBanner)
                .resizable()
                .scaledToFit()
            Image(.onlineStoreBanner)
                .resizable()
                .scaledToFit()
            Image(.deliveryServiceBanner)
                .resizable()
                .scaledToFit()
        }
    }
    
    private var dessertMenu: some View {
        VStack(alignment: .leading) {
            Text("하루가 달콤해지는 디저트")
                .font(.makeMedium18)
            
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(dessertViewModel.dessertList) { dessert in
                            CircleImageCard(menu: dessert, fontSize: 14)
                                .frame(width: 130)
                        }
                    }
                }

                HStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 5)
                    Spacer()
                }
                HStack {
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0), Color.white]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 5)
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    private var bottomEventBanner: some View {
        VStack(spacing: 15) {
            Image(.coldBrewBanner)
                .resizable()
                .scaledToFit()
            Image(.baristasFavoriteBanner)
                .resizable()
                .scaledToFit()
            Image(.starbucksMadeBanner)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    HomeView()
}
