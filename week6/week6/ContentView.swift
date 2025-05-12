//
//  ContentView.swift
//  week6
//
//  Created by BoMin Lee on 5/9/25.
//

import SwiftUI
import Foundation
import Security

//struct ContentView: View {
//    
//    var body: some View {
//        VStack(spacing: 15) {
//            ForEach(ButtonInfoList.buttonList, id: \.id) { button in
//                Button(action: {
//                    button.action()
//                }, label: {
//                    Text(button.title)
//                })
//            }
//        }
//        .padding()
//    }
//}
//
//struct ButtonInfo: Identifiable {
//    var id: UUID = .init()
//    var title: String
//    var action: () -> Void
//}
//
//final class ButtonInfoList {
//    
//    static let serviceManager: ServiceManager = .init()
//    
//    static let buttonList: [ButtonInfo] = [
//        .init(title: "GET", action: {
//            Task {
//                await serviceManager.getUser(name: "민볼")
//            }
//        }),
//        .init(title: "POST", action: {
//            Task {
//                await serviceManager.postUser(user: .init(name: "민볼", age: 24, address: "포항시 효자동", height: 166))
//                
//            }
//        }),
//        .init(title: "PATCH", action: {
//            Task {
//                await serviceManager.patchUser(name: "Minbol")
//            }
//        }),
//        .init(title: "PUT", action: {
//            Task {
//                await serviceManager.putUser(user: .init(name: "민볼", age: 20, address: "대구광역시", height: 200))
//            }
//        }),
//        .init(title: "DELETE", action: {
//            Task {
//                await serviceManager.deleteUser(name: "민볼")
//            }
//        }),
//    ]
//}

struct ContentView: View {
    
    let keychain = KeychainService.shared
    
    let tokenInfo = TokenInfo(accessToken: "abc123", refreshToken: "xyz456")
    
    enum ButtonType: String, CaseIterable {
        case save = "저장하기"
        case load = "불러오기"
        case delete = "삭제하기"
    }
    
    var body: some View {
        VStack(spacing: 10, content: {
            ForEach(ButtonType.allCases, id: \.rawValue, content: { button in
                Button(action: {
                    handleAction(button)
                }, label: {
                    Text(button.rawValue)
                        .font(.title)
                })
            })
        })
    }
    
    func handleAction(_ type: ButtonType) {
        switch type {
        case .save:
            keychain.saveToken(tokenInfo)
        case .load:
            keychain.loadToken()
        case .delete:
            keychain.deleteToken()
        }
    }
}

#Preview {
    ContentView()
}
