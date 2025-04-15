//
//  TemperatureToggle.swift
//  starbucks
//
//  Created by BoMin Lee on 4/6/25.
//

import SwiftUI

struct TemperatureToggleView: View {
    @Binding var selection: Temperature
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width / 2
            ZStack(alignment: .leading) {
                // 1) 트랙 배경
                RoundedRectangle(cornerRadius: geo.size.height / 2)
                    .fill(Color.gray.opacity(0.2))
                
                // 2) 슬라이딩 토글
                RoundedRectangle(cornerRadius: geo.size.height / 2)
                    .fill(Color.white)
                    .frame(width: w, height: geo.size.height)
                    .offset(x: selection == .hot ? 0 : w)
                    .animation(.easeInOut(duration: 0.25), value: selection)
                
                // 3) 두 개의 버튼
                HStack(spacing: 0) {
                    Button {
                        withAnimation { selection = .iced }
                    } label: {
                        Text(Temperature.hot.rawValue)
                            .frame(width: w, height: geo.size.height)
                            .font(.mainTextSemiBold18)
                            .foregroundColor(selection == .hot ? .red01 : .gray)
                    }
                    
                    Button {
                        withAnimation { selection = .hot }
                    } label: {
                        Text(Temperature.iced.rawValue)
                            .frame(width: w, height: geo.size.height)
                            .font(.mainTextSemiBold18)
                            .foregroundColor(selection == .iced ? .blue01 : .gray)
                    }
                }
            }
        }
        .frame(height: 36) // 원하는 높이
        .padding(.horizontal) // 좌우 여백
    }
}
