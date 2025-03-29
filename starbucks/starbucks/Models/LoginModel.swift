//
//  LoginModel.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import Foundation

class LoginModel: ObservableObject {
    @Published var id: String = ""
    @Published var pw: String = ""
    
    init(id: String = "", pw: String = "") {
        self.id = id
        self.pw = pw
    }
}
