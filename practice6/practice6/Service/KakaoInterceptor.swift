//
//  KakaoInterceptor.swift
//  practice6
//
//  Created by BoMin Lee on 5/15/25.
//

import Foundation
import Alamofire

class KakaoInterceptor: RequestInterceptor, @unchecked Sendable {
    private let kakaoAPIKey: String
    // xcconfig로 바꿔서 해보기~
    
    init(apiKey: String) {
        self.kakaoAPIKey = apiKey
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.headers.add(.authorization("KakaoAK \(kakaoAPIKey)"))
        
        completion(.success(request))
    }
}
