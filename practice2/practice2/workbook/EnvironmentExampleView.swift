//
//  EnvironmentExampleView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct EnvironmentExampleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text("현재 색상 모드: \(colorScheme == .dark ? "다크" : "라이트")")
                .padding()
                .background(colorScheme == .dark ? Color.black : Color.white)
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        }
    }
}

#Preview {
    EnvironmentExampleView()
}
