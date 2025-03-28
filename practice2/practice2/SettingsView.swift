//
//  SettingsView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("userAge") private var userAge: Int = 20
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Text("Age: \(userAge)")
            
            Button(action: {
                userAge += 1
            }, label: {
                Text("나이 증가")
            })
            
            Toggle("Dark Mode", isOn: $isDarkMode)
                .frame(width: 150)
        }
    }
}

#Preview {
    SettingsView()
}
