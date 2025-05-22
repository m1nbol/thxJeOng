//
//  starbucksApp.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct starbucksApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("nickname") var nickname = ""
    
    init() {
        if let credential = CredentialKeychainService.shared.loadCredential() {
            // 로그인 성공 처리
            isLoggedIn = true
            nickname = credential.nickname
        }
        let kakaoNativeAppKey = Config.kakaoNativeAppKey
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoggedIn {
                    MainTabView()
                } else {
                    LoginView()
                }
            }
            .onOpenURL { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            }
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
