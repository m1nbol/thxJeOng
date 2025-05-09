import SwiftUI


// POST

//let url = URL(string: "http://localhost:8080/person")!
//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//
//let parameters: [String: Any] = [
//      "name": "민볼",
//      "age": 24,
//      "address": "포항시 효자동",
//      "height": 166
//]
//
//request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    if let error = error {
//        print("에러: \(error)")
//        return
//    }
//    
//    if let httpResponse = response as? HTTPURLResponse {
//        print("상태 코드: \(httpResponse.statusCode)")
//    }
//    
//    if let data = data {
//        let responseString = String(data: data, encoding: .utf8)
//        print("응답: \(responseString!)")
//    }
//}
//
//task.resume()


// GET

//var urlComponents = URLComponents(string: "http://localhost:8080/person")!
//urlComponents.queryItems = [
//    URLQueryItem(name: "name", value: "민볼")
//]
//
//let url = urlComponents.url!
//
//let task = URLSession.shared.dataTask(with: url) { data, response, error in
//    if let error = error {
//        print("에러: \(error)")
//        return
//    }
//
//    if let httpResponse = response as? HTTPURLResponse {
//        print("상태 코드: \(httpResponse.statusCode)")
//    }
//
//    if let data = data {
//        let responseString = String(data: data, encoding: .utf8)
//        print("응답: \(responseString!)")
//    }
//}
//task.resume()

// PATCH

//let url = URL(string: "http://localhost:8080/person")!
//var request = URLRequest(url: url)
//request.httpMethod = "PATCH"
//
//let parameters: [String: Any] = [
//    "name": "Minbol",
//]
//request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    if let error = error {
//        print("에러: \(error)")
//        return
//    }
//
//    if let httpResponse = response as? HTTPURLResponse {
//        print("상태 코드: \(httpResponse.statusCode)")
//    }
//
//    if let data = data {
//        let responseString = String(data: data, encoding: .utf8)
//        print("응답: \(responseString!)")
//    }
//}
//task.resume()


// PUT

//let url = URL(string: "http://localhost:8080/person")!
//var request = URLRequest(url: url)
//request.httpMethod = "PUT"
//
//// 요청 본문에 전송할 데이터
//let parameters: [String: Any] = [
//    "name": "Minbol",
//    "age": 20,
//    "address": "대구광역시",
//    "height": 120
//]
//request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    if let error = error {
//        print("에러: \(error)")
//        return
//    }
//
//    if let httpResponse = response as? HTTPURLResponse {
//        print("상태 코드: \(httpResponse.statusCode)")
//    }
//
//    if let data = data {
//        let responseString = String(data: data, encoding: .utf8)
//        print("응답: \(responseString!)")
//    }
//}
//task.resume()


// DELETE

var urlComponents = URLComponents(string: "http://localhost:8080/person")!
urlComponents.queryItems = [
    URLQueryItem(name: "name", value: "Minbol")
]

let url = urlComponents.url!
var request = URLRequest(url: url)
request.httpMethod = "DELETE"

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("에러: \(error)")
        return
    }

    if let httpResponse = response as? HTTPURLResponse {
        print("Status Code: \(httpResponse.statusCode)")
    }

    if let data = data {
        let responseString = String(data: data, encoding: .utf8)
        print("Response Data: \(responseString!)")
    }
}
task.resume()
