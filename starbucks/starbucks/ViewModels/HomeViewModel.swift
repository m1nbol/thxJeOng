//
//  HomeViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    var homeModel: HomeModel = .init()
    @AppStorage("usernameStorage") private var username: String = ""

    var displayName: String {
        username.isEmpty ? "(설정한 닉네임)" : username
    }
}
