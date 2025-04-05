//
//  UserViewModel.swift
//  practice3
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation

@Observable
class UserViewModel {
    var users = [
        User(name: "Alice", age: 24),
        User(name: "Bob", age: 30),
        User(name: "Charlie", age: 28)
    ]
}
