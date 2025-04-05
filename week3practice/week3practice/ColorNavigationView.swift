//
//  ColorNavigationView.swift
//  week3practice
//
//  Created by BoMin Lee on 4/5/25.
//

import SwiftUI

struct ColorNavigationView: View {
    @Bindable var viewModel: RainbowViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            if let selectedRainbowModel = viewModel.selectedRainbowModel {
                Text("현재 선택된 색상")
                    .font(.headline)
                    .foregroundStyle(Color.gray)
                Text("\(selectedRainbowModel.returnColorName())")
                    .font(.title)
                    .foregroundStyle(selectedRainbowModel.returnColor())
                Button {
                    viewModel.appleLogoColor = selectedRainbowModel.returnColor()
                    dismiss()
                } label: {
                    Text("사과 색 바꾸기")
                        .padding(.vertical, 43)
                        .padding(.horizontal, 36)
                        .overlay {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.clear)
                                .stroke(Color.black, style: .init(lineWidth: 1))
                        }
                }

            }
        }
        .navigationTitle("색 네비게이션")
    }
}

