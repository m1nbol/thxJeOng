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
    @State private var selectedTemp: Temperature = .hot
    
    var id: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 20) {
                viewModel.menu(withId: id, selectedTemp: selectedTemp).image
                    .resizable()
                    .scaledToFit()
                VStack {
                    coffeeInformation
                        .padding(.horizontal, 10)
                    temperatureToggleButton
                }
                .frame(height: 256)
                Spacer()
                bottomButtonSection
            }
            .ignoresSafeArea(edges: .top)
            
            topButtons
                .padding(.horizontal, 8)
            
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar) // 이거 해야 탭바 안 보임
        .onAppear {
            selectedTemp = viewModel.menu(withId: id, selectedTemp: selectedTemp).temperature
        }
    }
    
    private var topButtons: some View {
        HStack {
            Button {
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
    }
    
    private var coffeeInformation: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(viewModel.menu(withId: id, selectedTemp: selectedTemp).name)
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(.black03)
                    Image(.new)
                    Spacer()
                }
                Text(viewModel.menu(withId: id, selectedTemp: selectedTemp).nameEnglish)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(.gray01)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.menu(withId: id, selectedTemp: selectedTemp).description.forceCharWrapping)
                    .font(.mainTextLight14)
                    .foregroundStyle(.gray06)
                    .kerning(-0.3)
                    .lineLimit(3, reservesSpace: true)
                    .multilineTextAlignment(.leading)
                Text("\(viewModel.menu(withId: id, selectedTemp: selectedTemp).price.withComma)원")
                    .font(.mainTextRegular24)
                    .foregroundStyle(.black03)
            }
            Spacer()
        }
    }
    
    private var temperatureToggleButton: some View {
        VStack {
            if viewModel.menu(withId: id, selectedTemp: selectedTemp).availableTemperatures.count == 2 {
                TemperatureToggleView(selection: $selectedTemp)
            } else {
                onlyTemperatureView
            }
            
        }
    }
    
    private var onlyTemperatureView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.clear)
                .stroke(.gray02)
                .frame(height: 36)
                .padding(.horizontal, 10)
            let temperature = viewModel.menu(withId: id, selectedTemp: selectedTemp).temperature.rawValue
            if temperature == "HOT" {
                Text("\(temperature) ONLY")
                    .foregroundStyle(.red01)
                    .font(.mainTextBold15)
            } else if temperature == "ICED" {
                Text("\(temperature) ONLY")
                    .foregroundStyle(.blue01)
                    .font(.mainTextBold15)
            }
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


#Preview {
    CoffeeDetailView(id: 4)
}

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
