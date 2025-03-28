//
//  ResponsiveButtonView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct ResponsiveButtonView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("반응형 버튼")
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.1)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ResponsiveButtonView_Preview: PreviewProvider {
    static let devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ResponsiveButtonView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
