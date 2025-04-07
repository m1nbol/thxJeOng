//
//  OrderView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/2/25.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack {
            Text("this is order view")
                .foregroundStyle(.blue01)
                .font(.mainTextBold20)
            Image(systemName: "bell.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.blue01)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    OrderView()
}
