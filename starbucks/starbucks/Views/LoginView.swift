//
//  LoginView.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            // Title 영역
            titleView()
            Spacer()
            // 아이디 및 비밀번호 입력 영역
            inputFieldsView()
            Spacer()
            // 로그인 및 회원가입 영역
            loginButtonsView
        }
        .padding(.top, 104)
        .padding(.horizontal, 19)
    }
}

// MARK: - Title 영역
private func titleView() -> some View {
    VStack(alignment: .leading) { // 여기서 leading 주면 vstack 내부 요소의 위치 결정
        Image("starbucksLogo")
            .resizable()
            .frame(width: 97, height: 97)
            .aspectRatio(contentMode: .fit)
        
        Spacer().frame(height: 28)
        
        Text("안녕하세요.\n스타벅스입니다.")
            .font(.mainTextExtraBold24)
            
        Spacer().frame(height: 19)
        
        Text("회원 서비스 이용을 위해 로그인 해주세요")
            .font(.mainTextMedium16)
            .foregroundColor(.secondary)
            .kerning(-0.05)
    }
    .frame(maxWidth: .infinity, alignment: .leading) // 여기서 leading 주면 frame 내에서 vstack 자체의 위치 결정
    .border(.red)
    // allignment leading을 어디서 주느냐에 따라 구조가 달라짐
}

// MARK: - 아이디 및 비밀번호 입력 영역
private func inputFieldsView() -> some View {
    VStack(spacing: 47) {
        VStack(alignment: .leading) {
            TextField("아이디", text: .constant(""))
                .font(.mainTextRegular13)
                .textFieldStyle(PlainTextFieldStyle())
            Divider()
        }
        .frame(height: 20)
        
        VStack(alignment: .leading) {
            SecureField("비밀번호", text: .constant(""))
                .font(.mainTextRegular13)
                .textFieldStyle(PlainTextFieldStyle())
            Divider()
        }
        .frame(height: 20)
        
        Button {
            print("로그인하기 누름")
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 46)
                    .cornerRadius(28)
                    .foregroundColor(Color.green01)
                
                Text("로그인하기")
                    .font(.mainTextMedium16)
                    .foregroundColor(Color.white01)
            }
        }

    }
}

// MARK: - 로그인 및 회원가입 영역
private var loginButtonsView : some View {
    VStack(spacing: 16) {
        // 이메일로 회원가입
        Text("이메일로 회원가입하기")
            .font(.mainTextRegular12)
            .foregroundColor(.gray04)
            .underline()
        
        // 카카오 로그인
        ZStack {
            Rectangle()
                .frame(height: 45)
                .cornerRadius(6)
                .foregroundColor(Color.kakaoYellow)
            HStack {
                Spacer().frame(width: 14)
                Image("kakaoLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Spacer()
                Text("카카오 로그인")
                    .font(.mainTextMedium16)
                Spacer()
            }
            .frame(height: 45)
        }
        .padding(.horizontal, 48)
        
        
        // 애플 로그인
        ZStack {
            Rectangle()
                .frame(height: 45)
                .cornerRadius(6)
                .foregroundColor(Color.black)
            HStack {
                Spacer().frame(width: 14)
                Image("appleLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Spacer()
                Text("Apple로 로그인")
                    .font(.mainTextMedium16)
                    .foregroundColor(Color.white01)
                Spacer()
            }
            .frame(height: 45)
        }
        .padding(.horizontal, 48)
        
    }
}


struct LoginView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            LoginView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
