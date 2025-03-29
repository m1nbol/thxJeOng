//
//  LoginViewModel.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import Foundation
import SwiftUI

@Observable
class LoginViewModel {
    var loginModel: LoginModel = LoginModel(id: "", pw: "")
    
    func login() {
        print("ID: \(loginModel.id), PW: \(loginModel.pw)")
    }
}
