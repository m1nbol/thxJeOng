//
//  String+.swift
//  starbucks
//
//  Created by BoMin Lee on 4/8/25.
//

import Foundation

extension String {
    var forceCharWrapping: Self {
        self.map({ String($0) }).joined(separator: "\u{200B}") // 200B: 가로폭 없는 공백문자 / 줄바꿈 글자 단위
    }
}
