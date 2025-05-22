//
//  UserRequest.swift
//  week7
//
//  Created by BoMin Lee on 5/18/25.
//

import Foundation

struct UserData: Codable {
    let name: String
    let age: Int
    let address: String
    let height: Double
}

struct UserPatchRequest: Codable {
    let name: String?
    let age: Int?
    let address: String?
    let height: Double?
}
