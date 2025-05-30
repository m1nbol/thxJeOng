//
//  SignUpViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var signUpModel: SignUpModel = SignUpModel(username: "", email: "", password: "")
    
    @AppStorage("usernameStorage") private var usernameStorage: String = ""
    @AppStorage("emailStorage") private var emailStorage: String = ""
    @AppStorage("passwordStorage") private var passwordStorage: String = ""
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("nickname") private var nickname: String = ""
    
    var isUsernameValid: Bool {
        !signUpModel.username.isEmpty
    }
    
    var isEmailValid: Bool {
        signUpModel.email.range(
            of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
            options: .regularExpression
        ) != nil
    }
    
    var isPasswordValid: Bool {
        !signUpModel.password.isEmpty
    }
    
    var isFormValid: Bool {
        isUsernameValid && isEmailValid && isPasswordValid
    }
    
    func signUp() {
//        usernameStorage = signUpModel.username
//        emailStorage = signUpModel.email
//        passwordStorage = signUpModel.password
//        
//        print("저장됨 \(usernameStorage), \(emailStorage)")
        
        let credential = UserCredential(email: signUpModel.email, nickname: signUpModel.username, password: signUpModel.password)
        CredentialKeychainService.shared.saveCredential(credential)
        
        isLoggedIn = true
        nickname = credential.nickname
        
        print("Keychain으로 시도")
    }
}
