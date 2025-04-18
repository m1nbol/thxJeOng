//
//  ReceiptViewModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/16/25.
//

import SwiftUI
import Vision

@Observable
class ReceiptViewModel {
    var receipts: [ReceiptModel] = []
    var currentReceipt: ReceiptModel?
    var totalCount:Int = 0
    var totalPrice: Int = 0
    
    func addReceipt(_ receipt: ReceiptModel) {
        receipts.append(receipt)
    }
    
    func removeReceipt(at index: Int) {
        guard receipts.indices.contains(index) else { return }
        receipts.remove(at: index)
    }
    
    func getReceipts() -> [ReceiptModel] {
        receipts
    }

//    func startOCR(from photo: PhotoModel, completion: @escaping (ReceiptModel?) -> Void) {
    func startOCR(from imageData: Data, completion: @escaping (ReceiptModel?) -> Void) {
        guard let uiImage = UIImage(data: imageData),
              let cgImage = uiImage.cgImage else {
            completion(nil)
            return
        }

        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                completion(nil)
                return
            }

            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            let parsed = self.parseWithoutRegex(from: fullText)

            DispatchQueue.main.async {
                parsed.imageData = imageData
                self.currentReceipt = parsed
                completion(parsed)
            }
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR"]
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }
    
    private func parseWithoutRegex(from text: String) -> ReceiptModel {
        let lines = text.components(separatedBy: .newlines)

        var store = "장소 없음"
        var totalAmount = 0
        
        var orderDateAndTime = Date(timeIntervalSinceNow: 0)

        var i = 0

        print("===== OCR 디버그 시작 =====")

        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🍏 [\(i)] \(trimmed)")
            
            // 장소
            if store == "장소 없음", trimmed.contains("점") {
                store = trimmed
            }

            // 결제 금액
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                    totalPrice = totalPrice + amount
                    totalCount += 1
                }
            }
            
            // 주문시각
//            if trimmed.starts(with: "25") || trimmed.starts(with: "24") {
//                print(trimmed)
//                let newTrimmed = "20"+trimmed
//                print(newTrimmed)
//                
//                let dateFormatter = DateFormatter()
//                dateFormatter.locale = Locale(identifier: "kr")
//                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//                let date = dateFormatter.date(from:newTrimmed)!
//                
//                let calendar = Calendar.current
//                let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
//                
//                orderDateAndTime = calendar.date(from:components) ?? Date(timeIntervalSinceNow: 0)
//            }
//            if trimmed.starts(with: "2025") || trimmed.starts(with: "2024") {
//                let dateFormatter = DateFormatter()
//                dateFormatter.locale = Locale(identifier: "kr")
//                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//                let date = dateFormatter.date(from:trimmed)!
//                
//                let calendar = Calendar.current
//                let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
//                
//                orderDateAndTime = calendar.date(from:components) ?? Date(timeIntervalSinceNow: 0)
//            }
            if trimmed.starts(with: "2025") || trimmed.starts(with: "2024") {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ko_KR")
                dateFormatter.dateFormat = "yyyy-MM-ddHH:mm:ss"

                if let date = dateFormatter.date(from: trimmed) {
                    orderDateAndTime = date
                }
            }

            i += 1
        }

        print("===== OCR 디버그 끝 =====")
        print("매장명: \(store)")
        print("결제 금액: \(totalAmount)")
        print("주문 시각: \(orderDateAndTime)")

        return ReceiptModel(
            store: store, date: orderDateAndTime, totalPrice: totalAmount
        )
    }
}
