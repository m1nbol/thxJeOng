//
//  ContentView.swift
//  practiceKakaoLogin
//
//  Created by BoMin Lee on 5/22/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print(Config.kakaoAppKey)
            } label: {
                Text("앱 키 출력")
            }
            Button(action: {
                if UserApi.isKakaoTalkLoginAvailable() {
                    // 카카오톡으로 로그인
                    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                        if let error = error {
                            print("카카오톡 로그인 실패: \(error)")
                        } else {
                            print("카카오톡 로그인 성공")
                            fetchKakaoUserInfo()
                        }
                    }
                } else {
                    // 카카오계정으로 로그인
                    UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                        if let error = error {
                            print("카카오계정 로그인 실패: \(error)")
                        } else {
                            print("카카오계정 로그인 성공")
                            fetchKakaoUserInfo()
                        }
                    }
                }
            }) {
                Text("카카오로 시작하기")
            }
        }
        .padding()
    }
    
    func fetchKakaoUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("사용자 정보 요청 실패: \(error)")
            } else {
                print("사용자 정보: \(String(describing: user))")
            }
        }
    }
}

#Preview {
    ContentView()
}
