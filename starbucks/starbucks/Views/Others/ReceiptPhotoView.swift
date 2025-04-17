//
//  ReceiptPhotoView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/17/25.
//

import SwiftUI

struct ReceiptPhotoView: View {
    let receipt: ReceiptModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
//        ZStack(alignment: .top) {
//            Color.black.opacity(0.8)
//                .ignoresSafeArea()
//            
//            if let data = receipt.imageData,
//               let uiImage = UIImage(data: data) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//            }
//            else {
//                Text("이미지를 불러올 수 없습니다.")
//                    .foregroundStyle(.white01)
//            }
//            Button {
//                dismiss()
//            } label: {
//                Image(systemName: "xmark")
//                    .resizable()
//                    .frame(width: 32, height: 32)
//                    .foregroundStyle(.black01)
//            }
//            
//        }
        
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            if let data = receipt.imageData,
               let uiImage = UIImage(data: data) {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .safeAreaPadding(.all)
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black01)
                    }
                    .safeAreaPadding(.all, 15)
                }
            }
            else {
                Text("이미지를 불러올 수 없습니다.")
                    .foregroundStyle(.white01)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black01)
                }
            }
            
        }
    }
}

//#Preview {
//    ReceiptPhotoView()
//}
