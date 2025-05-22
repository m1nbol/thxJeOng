//
//  TokenResponse.swift
//  week7
//
//  Created by BoMin Lee on 5/22/25.
//

import Foundation

struct TokenResponse: Codable {
    var accessToken: String
    var refreshToken: String
}
