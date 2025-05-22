//
//  ContentView.swift
//  week7
//
//  Created by BoMin Lee on 5/18/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(ButtonInfoList.buttonList, id: \.id) { button in
                Button(action: {
                    button.action()
                }, label: {
                    Text(button.title)
                })
            }
        }
        .padding()
    }
}

struct ButtonInfo: Identifiable {
    var id: UUID = .init()
    var title: String
    var action: () -> Void
}

final class ButtonInfoList {
    
    static let serviceManager: ContentsViewModel = .init()
    
    static let buttonList: [ButtonInfo] = [
        .init(title: "로그인", action: {
            serviceManager.loginAndStoreTokens()
        }),
        .init(title: "GET", action: {
            Task {
                await serviceManager.getUser()
            }
        }),
        .init(title: "POST", action: {
            serviceManager.createUser(.init(name: "민볼", age: 24, address: "포항시 효자동", height: 166))
        }),
        .init(title: "PATCH", action: {
            serviceManager.updateUserPatch(.init(name: nil, age: 20, address: nil, height: nil))
        }),
        .init(title: "PUT", action: {
            serviceManager.updateUserPut(.init(name: "Minbol", age: 21, address: "대구시", height: 180))
        }),
        .init(title: "DELETE", action: {
            serviceManager.deleteUser(name: "Minbol")
        }),
    ]
}

#Preview {
    ContentView()
}
