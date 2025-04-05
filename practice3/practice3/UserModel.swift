//
//  UserModel.swift
//  practice3
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
}
