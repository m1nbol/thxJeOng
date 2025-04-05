//
//  SignUpView.swift
//  starbucks
//
//  Created by BoMin Lee on 3/29/25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    @FocusState private var focusedField: SignUpInputFieldFocus?
    
    var body: some View {
        VStack {
            inputFieldsView
            Spacer()
            Button {
                print("생성하기 누름")
                viewModel.signUp()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 58)
                        .cornerRadius(20)
                        .foregroundColor(Color.green01)
                    
                    Text("생성하기")
                        .font(.makeMedium18)
                        .foregroundColor(Color.white01)
                }
            }

        }
        .safeAreaPadding(.bottom)
        .safeAreaPadding(.top, 172)
        .padding(.horizontal, 19)
        
    }
    
    private var inputFieldsView: some View {
        VStack(spacing: 49) {
            VStack {
                TextField(
                    "닉네임",
                    text: $viewModel.signUpModel.username
                )
                .font(.mainTextRegular18)
                .textFieldStyle(PlainTextFieldStyle())
                .focused($focusedField, equals: .nickname)
                Divider()
                    .background(focusedField == .nickname ? Color.green01 : Color.gray00)
            }
            VStack {
                TextField(
                    "이메일",
                    text: $viewModel.signUpModel.email
                )
                .font(.mainTextRegular18)
                .textFieldStyle(PlainTextFieldStyle())
                .focused($focusedField, equals: .email)
                Divider()
                    .background(focusedField == .email ? Color.green01 : Color.gray00)
            }
            VStack {
                TextField(
                    "비밀번호",
                    text: $viewModel.signUpModel.password
                )
                .font(.mainTextRegular18)
                .textFieldStyle(PlainTextFieldStyle())
                .focused($focusedField, equals: .pw)
                Divider()
                    .background(focusedField == .pw ? Color.green01 : Color.gray00)
            }
        }
    }
}

enum SignUpInputFieldFocus {
    case nickname, email, pw
}

struct SignUpView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            SignUpView(viewModel: SignUpViewModel())
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
