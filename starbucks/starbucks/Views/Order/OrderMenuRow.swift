//
//  OrderMenuRow.swift
//  starbucks
//
//  Created by BoMin Lee on 4/29/25.
//

import SwiftUI

struct OrderMenuRow: View {
    let orderMenu: OrderMenuModel
    
    var body: some View {
        HStack(spacing: 16) {
            orderMenu.image
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 60)
            VStack(alignment: .leading, spacing: 4) {
                Text(orderMenu.name)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(.gray06)
                Text(orderMenu.nameEnglish)
                    .font(.mainTextSemiBold13)
                    .foregroundStyle(.gray03)
            }
        }
    }
}
