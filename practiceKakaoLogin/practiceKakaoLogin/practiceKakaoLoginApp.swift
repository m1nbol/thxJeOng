//
//  practiceKakaoLoginApp.swift
//  practiceKakaoLogin
//
//  Created by BoMin Lee on 5/22/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct practiceKakaoLoginApp: App {
    init() {
        let kakaoAppKey = Config.kakaoAppKey
        KakaoSDK.initSDK(appKey: kakaoAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
