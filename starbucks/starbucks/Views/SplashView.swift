//
//  SplashView.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color.green00)
            Image("starbucksLogo")
                .frame(width: 168, height: 168)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashView()
}
