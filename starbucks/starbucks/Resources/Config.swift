//
//  Config.swift
//  starbucks
//
//  Created by BoMin Lee on 5/18/25.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let kakaoNativeAppKey: String = {
        guard let kakaoNativeAppKey = Config.infoDictionary["KAKAO_NATIVE_APP_KEY"] as? String else {
            fatalError()
        }
        return kakaoNativeAppKey
    }()
}
