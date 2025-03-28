//
//  DynamicLayoutView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct DynamicLayoutView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("전체 화면의 50% 크기 박스")
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.3)
                    .background(Color.green.opacity(0.5))
                    .border(Color.green)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)  // 전체 화면 크기 적용
            .border(Color.red)
        }
    }
}

#Preview {
    DynamicLayoutView()
}
