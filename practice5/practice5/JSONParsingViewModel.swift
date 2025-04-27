//
//  JSONParsingViewModel.swift
//  practice5
//
//  Created by BoMin Lee on 4/27/25.
//

import Foundation

@Observable
class JSONParsingViewModel {
    var myProfile: MyModel?
    
    func loadMyProfile(completion: @escaping (Result<MyModel, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("😵 json 파일 없음")
            completion(.failure(NSError(domain: "⚠️ 파일을 찾을 수 없습니다.", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(MyModel.self, from: data)
            self.myProfile = decoded
            print("❇️ 디코딩 성공")
            completion(.success(decoded))
        } catch {
            print("❌ 디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}

