//
//  ReceiptListCell.swift
//  starbucks
//
//  Created by BoMin Lee on 4/16/25.
//

import SwiftUI

struct ReceiptListCell: View {
    let receipt: ReceiptModel
    let onImageTapped: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    Text("\(receipt.store)")
                        .foregroundStyle(.black)
                    Text("\(receipt.date.formattedForReceipt())")
                        .font(.mainTextMedium16)
                        .foregroundStyle(.gray03)
                    Text("\(receipt.totalPrice.withComma)원")
                        .foregroundStyle(.brown02)
    //                if let currentReceipt = receiptViewModel.currentReceipt {
    //                    Text("\(currentReceipt.store)")
    //                        .foregroundStyle(.black)
    //                    Text("\(currentReceipt.date)")
    //                        .font(.mainTextMedium16)
    //                        .foregroundStyle(.gray03)
    //                    Text("\(currentReceipt.totalPrice.withComma)원")
    //                        .foregroundStyle(.brown02)
    //                } else {
    //                    Text("사당역")
    //                        .foregroundStyle(.black)
    //                    Text("2024-01-05 11:30")
    //                        .font(.mainTextMedium16)
    //                        .foregroundStyle(.gray03)
    //                    Text("6,500원")
    //                        .foregroundStyle(.brown02)
    //                }
                }
                .font(.mainTextSemiBold18)
                .padding(.bottom, 14)
                Spacer()
                Button {
                    print("영수증 이미지 보기")
                    onImageTapped()
                } label: {
                    Image(.receiptDollarSign)
                        .scaledToFit()
                }
            }
            .background(.white01)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray01)
        }
        .onAppear {
            print(receipt.imageData != nil ? "✅ 이미지 있음" : "❌ 이미지 없음")
        }
    }
}

//#Preview {
//    ReceiptListCell()
//}
