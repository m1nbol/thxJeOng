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
    
    @AppStorage("username") private var username: String = "Minbol"
    
    var screenSize: CGRect {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds
    }
    
    
    var body: some View {
        VStack {
            Text("Screen Width: \(screenSize.width)")
            Text("Screen Height: \(screenSize.height)")
                .padding(.bottom, 20)
            Text("Hello, \(username)!")
                .font(.title)
            Button("Change Name") {
                username = "Apple"
            }
            .padding(.bottom, 20)
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

struct LoginView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
