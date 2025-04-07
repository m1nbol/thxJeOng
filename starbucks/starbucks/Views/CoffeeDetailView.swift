//
//  CoffeeDetailView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = MenuDetailViewModel()
    
    var id: Int = 0
//    let coffee: MenuDetailModel
    
    var body: some View {
        VStack(spacing: 200) {
            VStack(spacing: 10){
                topImage
                coffeeInformation
                    .padding(.horizontal, 10)
            }
            bottomButtonSection
                .safeAreaPadding(.bottom, 14)
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
    }
    
    private var topImage: some View {
        ZStack(alignment: .top) {
            viewModel.menu(withId: id).image
                .resizable()
                .scaledToFill()
            HStack {
                Button {
//                    print("뒤로가기")
                    dismiss()
                } label: {
                    Image(.chevronBack)
                }
                Spacer()
                Button {
                    print("공유하기")
                } label: {
                    Image(.share)
                }
            }
            .padding(.horizontal, 8)
            .safeAreaPadding(.top, 60)
        }
        .ignoresSafeArea()
    }
    
    private var coffeeInformation: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(viewModel.menu(withId: id).name)
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(.black03)
                    Image(.new)
                    Spacer()
                }
                Text(viewModel.menu(withId: id).nameEnglish)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(.gray01)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.menu(withId: id).description)
                    .font(.mainTextLight14)
                    .foregroundStyle(.gray06)
                    .kerning(-0.3)
                    .lineLimit(3, reservesSpace: true)
                    .multilineTextAlignment(.leading)
                Text("\(viewModel.menu(withId: id).price.withComma)원")
                    .font(.mainTextRegular24)
                    .foregroundStyle(.black03)
            }
            Spacer()
        }
    }
    
    private var bottomButtonSection: some View {
        ZStack(alignment: .center) {
            Color.white
            coffeeOrderButton
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .shadow(color: .black.opacity(0.04), radius: 3.5, x: 0, y: -3)
    }
    
    private var coffeeOrderButton: some View {
        Button {
            print("주문하기 누름")
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 43)
                    .cornerRadius(21)
                    .foregroundColor(Color.green01)
                Text("주문하기")
                    .font(.mainTextMedium16)
                    .foregroundColor(Color.white01)
            }
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 15)
    }
}


//#Preview {
//    CoffeeDetailView(coffee: MenuDetailModel(id: 1, name: "에스프레소 콘파냐", nameEnglish: "Espresso Con Panna", description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: 4100, temperature: .onlyHot, image: Image(.conpanna)))
//}

//struct CoffeDetailView_Preview: PreviewProvider {
//    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
//    static var previews: some View {
//        ForEach(devices, id: \.self) { device in
//            CoffeeDetailView(coffee: MenuDetailModel(id: 1, name: "에스프레소 콘파냐", nameEnglish: "Espresso Con Panna", description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: 4100, temperature: .onlyHot, image: Image(.conpanna)))
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
//}
