//
//  LoginViewModel.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import Foundation
import SwiftUI
import KakaoSDKUser
import KakaoSDKAuth

class LoginViewModel: ObservableObject {
    var loginModel: LoginModel = LoginModel(id: "", pw: "")
    
    @AppStorage("emailStorage") private var savedEmail: String = ""
    @AppStorage("passwordStorage") private var savedPassword: String = ""
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("nickname") private var nickname = ""
    
    @Published var isLoginSuccess: Bool = false
    @Published var loginErrorMessage: String?

    func login() {
        if loginModel.id == savedEmail && loginModel.pw == savedPassword {
            isLoginSuccess = true
            loginErrorMessage = nil
            isLoggedIn = true
            print("로그인 성공")
        } else {
            isLoginSuccess = false
            loginErrorMessage = "이메일 또는 비밀번호가 일치하지 않습니다."
        }
    }
    
    func attemptAutoLogin() {
        guard let credential = CredentialKeychainService.shared.loadCredential() else {
            print("🔒 자동 로그인 실패")
            return
        }
        isLoggedIn = true
        nickname = credential.nickname
        print("🔁 자동 로그인 성공: \(credential.email)")
    }

    func kakaoLogin() {
        if AuthApi.hasToken() {
            print("✅ 토큰 있음")
        } else {
            print("❌ 토큰 없음 → 로그인 필요")
        }
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print("❌ 로그인 실패: \(error)")
                } else {
                    print("✅ 로그인 성공: \(oauthToken?.accessToken ?? "없음")")
                    self.fetchKakaoUserInfo()
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print("❌ 웹 로그인 실패:", error)
                } else {
                    print("✅ 웹 로그인 성공! accessToken: \(oauthToken?.accessToken ?? "없음")")
                    self.fetchKakaoUserInfo()
                }
            }
        }
    }
    
    func fetchKakaoUserInfo() {
        UserApi.shared.me { user, error in
            if let error = error {
                print("❌ 사용자 정보 조회 실패: \(error)")
            } else {
                let nickname = user?.kakaoAccount?.profile?.nickname ?? "카카오 사용자"
                
                // ✅ 내 앱 상태 저장
                self.nickname = nickname
                self.isLoggedIn = true
                
                // ✅ 필요하면 KeychainService에 저장
                print("✅ 로그인 성공 - 닉네임: \(nickname)")
            }
        }
    }
}
