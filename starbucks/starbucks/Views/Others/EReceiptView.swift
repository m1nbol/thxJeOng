//
//  EReceiptView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/16/25.
//

import SwiftUI

struct EReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    @State var showAddActionSheet = false
    
    var body: some View {
        VStack {
            topNavigationBar
            Spacer()
        }
        .background(.white01)
        .navigationBarBackButtonHidden(true)
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
                Button("앨범에서 가져오기") {}
                Button("카메라로 촬영하기") {}
                Button("취소", role: .cancel) {}
            }
        }
        .padding(.horizontal, 13.5)
        .padding(.bottom, 22)
        .foregroundStyle(.black)
        .background(.white)
    }
}

#Preview {
    EReceiptView()
}
