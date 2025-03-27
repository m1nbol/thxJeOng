//
//  ContentView.swift
//  practice2
//
//  Created by BoMin LEE on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isClicked: Bool = false
    @State private var clickCount: Int = 0
    
    var body: some View {
        VStack {
            Text("현재 State 변수 값: \(isClicked)")
            Text("현재 Click Count: \(clickCount)")
            
            CustomButton(isClicked: $isClicked, clickCount: $clickCount)
            
        }
    }
}

struct CustomButton: View {
    
    @Binding var isClicked: Bool
    @Binding var clickCount: Int
    
    init(isClicked: Binding<Bool>, clickCount: Binding<Int>) {
        self._isClicked = isClicked
        self._clickCount = clickCount
    }
    
    var body: some View {
        Button(action: {
            isClicked.toggle()
            clickCount += 1
            print("하위 뷰에서 클릭해서 값 변경함 : \(isClicked)")
        }, label: {
            Text("상위 뷰의 값을 State 값 변경")
        })
    }
}

#Preview {
    ContentView()
}
