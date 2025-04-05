//
//  CustomNavigationBar.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    let title: String
    let onBack: (() -> Void)?
    
    var body: some View {
        HStack {
            if let onBack = onBack {
                Button {
                    onBack()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .tint(.black)
            }
            Spacer()
            Text(title)
                .font(.mainTextMedium16)
            Spacer()
            if onBack != nil {
                Image(systemName: "chevron.left")
                    .opacity(0)
            }
        }
        .padding(0)
    }
}
