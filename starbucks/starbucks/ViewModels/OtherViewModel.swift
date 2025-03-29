//
//  OtherViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 3/30/25.
//

import SwiftUI

class OtherViewModel: ObservableObject {
    @AppStorage("usernameStorage") private var username: String = ""

    var displayName: String {
        username.isEmpty ? "(작성한 닉네임)" : username
    }
}
