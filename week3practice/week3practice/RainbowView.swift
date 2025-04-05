//
//  RainbowView.swift
//  week3practice
//
//  Created by BoMin Lee on 4/5/25.
//

import SwiftUI

struct RainbowView: View {
    private var viewModel: RainbowViewModel = .init()
    @State private var navigationTrue: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                colorCardGroup
                Spacer()
                bottomSelectedColorGroup
            }
            .safeAreaPadding(EdgeInsets(top: 47, leading: 15, bottom: 43, trailing: 15))
            .navigationDestination(isPresented: $navigationTrue) {
                ColorNavigationView(viewModel: viewModel)
            }
        }
    }
    
    private var colorCardGroup: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 40), count: 3), spacing: 26) {
            ForEach(RainbowModel.allCases, id: \.self) { rainbow in
                makeColorCard(rainbow)
                    .onTapGesture {
                        viewModel.selectedRainbowModel = rainbow
                        self.navigationTrue.toggle()
                    }
            }
        }
    }
    
    private func makeColorCard(_ model: RainbowModel) -> some View {
        VStack(spacing: 6) {
            Rectangle()
                .fill(model.returnColor())
            Text(model.returnColorName())
                .foregroundStyle(.black)
                .font(.title)
        }
        .frame(maxWidth: .infinity, minHeight: 110)
    }
    
    private var bottomSelectedColorGroup: some View {
        VStack(spacing: 70) {
            Image(.appleLogo)
                .renderingMode(.template)
                .fixedSize()
                .foregroundStyle(viewModel.appleLogoColor ?? Color.black)
            
            Text("현재 선택된 색상 : \(selectedColorName())")
                .font(.headline)
                .foregroundStyle(viewModel.appleLogoColor ?? Color.gray)
        }
    }
    
    private func selectedColorName() -> String {
        if let name = viewModel.selectedRainbowModel {
            return name.returnColorName()
        } else {
            return "선택된 색상 없음"
        }
    }
    
    
}

#Preview {
    RainbowView()
}
