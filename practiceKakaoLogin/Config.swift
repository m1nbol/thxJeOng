//
//  Config.swift
//  practiceKakaoLogin
//
//  Created by BoMin Lee on 5/22/25.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let kakaoAppKey: String = {
        guard let kakaoAppKey = Config.infoDictionary["KAKAO_APP_KEY"] as? String else {
            fatalError()
        }
        return kakaoAppKey
    }()
}
