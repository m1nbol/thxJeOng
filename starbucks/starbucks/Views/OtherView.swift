//
//  OtherView.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import SwiftUI

struct OtherView: View {
    @StateObject private var viewModel = OtherViewModel()
    
    var body: some View {
        VStack(spacing: 41) {
            HStack {
                Text("Other")
                    .font(.mainTextBold24)
                Spacer()
                Button {
                    print("로그아웃")
                } label: {
                    Image(.logOut)
                }
                
            }
            .padding(.horizontal, 23.5)
            .padding(.bottom, 16)
            .background(.white)
            VStack {
                VStack(spacing: 24) {
                    VStack {
                        Text(viewModel.displayName)
                            .foregroundStyle(.green01)
                        +
                        Text(" 님")
                        Text("환영합니다! 🙌🏻")
                    }
                    .foregroundStyle(.black03)
                    .font(.mainTextSemiBold24)
                    HStack(spacing: 10.5) {
                        Spacer()
                        OtherButtonView(buttonText: "별 히스토리", buttonImage: Image(.starHistory))
                        OtherButtonView(buttonText: "전자영수증", buttonImage: Image(.receipt))
                        OtherButtonView(buttonText: "나만의 메뉴", buttonImage: Image(.myMenu))
                        Spacer()
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Pay")
                        .font(.mainTextSemiBold18)
                    HStack {
                        OtherSmallButtonView(buttonText: "스타벅스 카드 등록", buttonImage: Image(.starbucksCard))
                        Spacer()
                        OtherSmallButtonView(buttonText: "카드 교환권 등록", buttonImage: Image(.cardChange))
                    }
                    .padding(.vertical, 16)
                    HStack {
                        OtherSmallButtonView(buttonText: "쿠폰 등록", buttonImage: Image(.coupon))
                        Spacer()
                        OtherSmallButtonView(buttonText: "쿠폰 히스토리", buttonImage: Image(.couponHistory))
                    }
                    .padding(.vertical, 16)
                    Divider()
                        .foregroundStyle(.black.opacity(0.12))
                        .frame(width: 327)
                }
                .padding(.horizontal, 10)
                Spacer()
                VStack(alignment: .leading) {
                    Text("고객지원")
                        .font(.mainTextSemiBold18)
                    HStack {
                        OtherSmallButtonView(buttonText: "스토어 케어", buttonImage: Image(.storeCare))
                        Spacer()
                        OtherSmallButtonView(buttonText: "고객의 소리", buttonImage: Image(.customer))
                    }
                    .padding(.vertical, 16)
                    HStack {
                        OtherSmallButtonView(buttonText: "매장 정보", buttonImage: Image(.storeInfo))
                        Spacer()
                        OtherSmallButtonView(buttonText: "반납기 정보", buttonImage: Image(.returnInfo))
                    }
                    .padding(.vertical, 16)
                    HStack {
                        OtherSmallButtonView(buttonText: "마이 스타벅스 리뷰", buttonImage: Image(.myReview))
                        Spacer()
                    }
                    .padding(.top, 16)
                }
                .padding(.horizontal, 10)
            }
            .frame(maxWidth: .infinity)
        }
        .background(.white01)
    }
    
    struct OtherButtonView: View {
        let buttonText: String
        let buttonImage: Image
        
        var body: some View {
            Button {
                print(buttonText)
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 102, height: 108)
                        .cornerRadius(15)
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
                    VStack(alignment: .center) {
                        buttonImage
                            .resizable()
                            .frame(width: 48, height: 48)
                        Text(buttonText)
                            .font(.mainTextSemiBold16)
                            .foregroundColor(.black03)
                    }
                }
                
            }
        }
    }
    
    struct OtherSmallButtonView: View {
        let buttonText: String
        let buttonImage: Image
        
        var body: some View {
            Button {
                print(buttonText)
            } label: {
                HStack(alignment: .center) {
                    buttonImage
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text(buttonText)
                        .font(.mainTextSemiBold16)
                        .foregroundColor(.black02)
                    Spacer()
                }
            }
            .frame(height: 32)
        }
    }
}

#Preview {
    OtherView()
}
