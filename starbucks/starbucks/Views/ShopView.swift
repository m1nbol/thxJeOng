//
//  ShopView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/8/25.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        VStack {
            Text("this is shop view")
                .foregroundStyle(.blue01)
                .font(.mainTextBold20)
            Image(systemName: "basket.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.blue01)
                .frame(width: 100, height: 100)
        }
        
    }
}

#Preview {
    ShopView()
}
