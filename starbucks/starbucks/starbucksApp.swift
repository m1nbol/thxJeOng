//
//  starbucksApp.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import SwiftUI

@main
struct starbucksApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
