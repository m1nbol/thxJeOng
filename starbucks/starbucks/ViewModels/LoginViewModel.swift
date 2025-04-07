//
//  LoginViewModel.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    var loginModel: LoginModel = LoginModel(id: "", pw: "")
    
    @AppStorage("emailStorage") private var savedEmail: String = ""
    @AppStorage("passwordStorage") private var savedPassword: String = ""
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
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
}
