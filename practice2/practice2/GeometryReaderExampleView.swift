//
//  GeometryReaderExampleView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct GeometryReaderExampleView: View {
    var body: some View {
        GeometryReader { geometry in  //현재 뷰가 차지하는 크기 정보 제공
            VStack {
                Text("뷰 너비: \(geometry.size.width)")
                Text("뷰 높이: \(geometry.size.height)")
            }
            .frame(width: geometry.size.width, height: geometry.size.height)  // 동적으로 크기 설정
            .background(Color.blue.opacity(0.3))
        }
    }
}

#Preview {
    GeometryReaderExampleView()
}
