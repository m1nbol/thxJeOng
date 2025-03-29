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
    
    func signUp() {
        usernameStorage = signUpModel.username
        emailStorage = signUpModel.email
        passwordStorage = signUpModel.password
        
        print("저장됨 \(usernameStorage), \(emailStorage)")
    }
}
