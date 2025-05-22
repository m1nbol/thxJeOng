//
//  CredentailKeychainService.swift
//  starbucks
//
//  Created by BoMin Lee on 5/15/25.
//

import Foundation
import Security

final class CredentialKeychainService {
    static let shared = CredentialKeychainService()
    private init() {}

    private let account = "userCredential"
    private let service = "com.myKeychain.userCredential"

    func saveCredential(_ credential: UserCredential) {
        do {
            let data = try JSONEncoder().encode(credential)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecAttrService as String: service,
                kSecValueData as String: data,
                kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
            ]
            SecItemDelete(query as CFDictionary)
            let status = SecItemAdd(query as CFDictionary, nil)
            print(status == errSecSuccess ? "✅ 자격 저장 성공" : "❌ 자격 저장 실패: \(status)")
        } catch {
            print("❌ JSON 인코딩 실패:", error)
        }
    }

    func loadCredential() -> UserCredential? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess, let data = item as? Data else {
            print("❌ 자격 불러오기 실패: \(status)")
            return nil
        }

        do {
            return try JSONDecoder().decode(UserCredential.self, from: data)
        } catch {
            print("❌ JSON 디코딩 실패:", error)
            return nil
        }
    }

    func deleteCredential() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        let status = SecItemDelete(query as CFDictionary)
        print(status == errSecSuccess ? "🗑️ 자격 삭제 성공" : "❌ 자격 삭제 실패: \(status)")
    }
}
