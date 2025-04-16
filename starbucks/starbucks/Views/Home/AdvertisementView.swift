//
//  AdvertisementView.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import SwiftUI

struct AdvertisementView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showAdvertisement: Bool
    
    var body: some View {
        VStack() {
            Image(.advertisement)
            Spacer()
            VStack(spacing: 19) {
                Button {
                    print("자세히 보기")
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 58)
                            .cornerRadius(20)
                            .foregroundColor(Color.green01)
                        
                        Text("자세히 보기")
                            .font(.makeMedium18)
                            .foregroundColor(Color.white01)
                    }
                }
                HStack {
                    Spacer()
                    Button {
                        showAdvertisement = false
                        dismiss()
                    } label: {
                        Text("X 닫기")
                            .font(.mainTextLight14)
                            .foregroundStyle(.gray05)
                    }
                }
                .padding(.trailing, 19)
                .padding(.bottom, 36)
            }
            .padding(.horizontal, 18)
        }
//        .safeAreaPadding(.top, 0)
        .ignoresSafeArea()
    }
}

#Preview {
    @Previewable @State var showAdvertisement = true
    AdvertisementView(showAdvertisement: $showAdvertisement)
}
