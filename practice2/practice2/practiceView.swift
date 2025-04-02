//
//  practiceView.swift
//  practice2
//
//  Created by BoMin Lee on 4/2/25.
//

import SwiftUI

struct practiceView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.green, lineWidth: 2)

                Text("버튼")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .frame(width: 200, height: 200)
//            .border(.red)
            Spacer()
            Text("버튼")
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 2)
                )
                .frame(width: 200, height: 200)
//                .border(.blue)
        }
    }
}

#Preview {
    practiceView()
}
