//
//  StoreRow.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import Foundation
import SwiftUI

struct StoreRow: View {
    
    let store: Store
    let distance: Double
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            // 임시 매장 사진
            Image(.storeExample)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(6)
            
            VStack(alignment: .leading, spacing: 15) {
    
                VStack(alignment: .leading, spacing: 3) {
                    Text(store.sotreNm)
                        .font(.mainTextSemiBold13)
                        .foregroundStyle(.black03)
                    if !store.address.isEmpty {
                        Text(store.address)
                            .font(.mainTextMedium10)
                            .foregroundStyle(.gray02)
                    }
                    
                }
                HStack {
                    if let category = StoreCategory(rawValue: store.category),
                       let iconName = category.iconName {
                        Image(iconName)
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    Spacer()
                    Text(String(format: "%.1f km", distance))
                        .font(.mainTextMedium12)
                        .foregroundStyle(.black01)
                }
            }
            .padding(.vertical, 6)
            Spacer()
        }
    }
}
