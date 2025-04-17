//
//  EReceiptView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/16/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var showAddActionSheet = false
    @State var showPhotoPicker = false
    @State var showReceiptImage = false
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImage: UIImage? = nil
    @State private var selectedReceipt: ReceiptModel?
    
    @State private var receiptViewModel: ReceiptViewModel = .init()
    
    var body: some View {
        VStack {
            topNavigationBar
            receiptList
            Spacer()
        }
        .background(.white01)
        .navigationBarBackButtonHidden(true)
//        .fullScreenCover(isPresented: $showReceiptImage) {
//            if let receipt = selectedReceipt {
//                ReceiptPhotoView(receipt: receipt)
//            }
//        }
        .fullScreenCover(item: $selectedReceipt) { receipt in
            ReceiptPhotoView(receipt: receipt)
        }
    }
    
    private var topNavigationBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
            }
            Spacer()
            Text("전자영수증")
                .font(.mainTextMedium16)
            Spacer()
            Button {
                showAddActionSheet = true
            } label: {
                Image(systemName: "plus")
            }
            .confirmationDialog("영수증을 어떻게 추가할까요?",
                                isPresented: $showAddActionSheet,
                                titleVisibility: .visible) {
                Button("앨범에서 가져오기") {
                    showPhotoPicker = true
                }
                Button("카메라로 촬영하기") {}
                Button("취소", role: .cancel) {}
            }
            .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItems, maxSelectionCount: 1, matching: .images)
            .onChange(of: selectedItems) { oldItems, newItems in
                for item in newItems {
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            let photo = PhotoModel(imageData: data)
                            receiptViewModel.startOCR(from: photo) { parsedReceipt in
                                guard let receipt = parsedReceipt else {
                                    print("❗️현재 영수증 불러오기 실패")
                                    return
                                }
                                
                                receipt.imageData = data
                                receiptViewModel.addReceipt(receipt)
                                modelContext.insert(receipt)
                                try? modelContext.save()
                                print("📸 이미지 추가 및 저장 완료")
                            }
//                            if let currentReceipt = receiptViewModel.currentReceipt {
//                                receiptViewModel.addReceipt(currentReceipt)
//                                modelContext.insert(currentReceipt)
//                                try? modelContext.save()
//                                print("📸 이미지 추가 및 저장 완료")
//                            } else {
//                                print("❗️현재 영수증 불러오기 실패")
//                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 13.5)
        .padding(.bottom, 22)
        .foregroundStyle(.black)
        .background(.white)
    }
    
    private var receiptList: some View {
        VStack(spacing: 24) {
            HStack {
                Text("총 ")
                +
                Text("\(receiptViewModel.totalCount)건")
                    .foregroundStyle(.brown01)
                    .font(.mainTextSemiBold18)
                Spacer()
                Text("사용합계 ")
                +
                Text("\(receiptViewModel.totalPrice.withComma)")
                    .foregroundStyle(.brown01)
                    .font(.mainTextSemiBold18)
                +
                Text("원")
                    .font(.mainTextSemiBold18)
            }
            .font(.mainTextRegular18)
            .foregroundStyle(.black)
            .padding(.top, 16)
//            .padding(.horizontal, 18)
            
//            ScrollView(.vertical) {
//                LazyVStack(spacing: 12) {
//                    ForEach(receiptViewModel.receipts) { receipt in
//                        ReceiptListCell(receipt: receipt)
//                    }
//                }
//                .padding(.horizontal, 18)
//            }
            
            List {
                ForEach(receiptViewModel.receipts) {
                    receipt in
                    ReceiptListCell(receipt: receipt) {
                        print("셀 클로저 함수")
                        selectedReceipt = receipt
                        showReceiptImage = true
                    }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .scrollContentBackground(.hidden)
                        .background(.white01)
                }
//                .background(.white01)
//                .scrollContentBackground(.hidden)
            }
            .listStyle(.plain)
//            .padding(.horizontal, 18)
            // List 쓸 거면 백그라운드 색 입히고 listStyle 플레인
            // scrollContentBackground 히든으로
        }
        .padding(.horizontal, 18)
    }
}

#Preview {
    EReceiptView()
}
