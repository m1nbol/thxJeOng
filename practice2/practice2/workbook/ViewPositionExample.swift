//
//  ViewPositionExample.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct ViewPositionExample: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("뷰의 X 좌표: \(geometry.frame(in: .global).origin.x)")
                Text("뷰의 Y 좌표: \(geometry.frame(in: .global).origin.y)")
            }
            .frame(width: 200, height: 100)
            .background(Color.orange.opacity(0.5))
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)  // 중앙 배치
        }
    }
}

#Preview {
    ViewPositionExample()
}
