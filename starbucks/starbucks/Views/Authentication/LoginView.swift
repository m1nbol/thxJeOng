//
//  LoginView.swift
//  starbucks
//
//  Created by BoMin LEE on 3/20/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @FocusState private var focusedField: LoginInputFieldFocus?
    @State private var showAutoLoginPrompt = false
    
    var body: some View {
        NavigationStack {
            VStack{
                // Title 영역
                titleView
                Spacer()
                // 아이디 및 비밀번호 입력 영역
                inputFieldsView
                Spacer()
                // 로그인 및 회원가입 영역
                loginButtonsView
            }
            .padding(.top, 104)
            .padding(.horizontal, 19)
        }
        .fullScreenCover(isPresented: $viewModel.isLoginSuccess) {
            MainTabView()
        }
        .task {
            if CredentialKeychainService.shared.loadCredential() != nil {
                showAutoLoginPrompt = true
            }
        }
    }
    
    // MARK: - Title 영역
    private var titleView: some View {
        VStack(alignment: .leading) { // 여기서 leading 주면 vstack 내부 요소의 위치 결정
            Image("starbucksLogo")
                .resizable()
                .frame(width: 97, height: 97)
                .aspectRatio(contentMode: .fit)
            
            Spacer().frame(height: 28)
            
    //        Text("안녕하세요.\n스타벅스입니다.")
    //            .font(.mainTextExtraBold24)
            
            Group { // Group으로 하는 게 뭔가 더 편리할 거 같음
                Text("안녕하세요.")
                Text("스타벅스입니다.")
            }
            .font(.mainTextExtraBold24)
            .kerning(1.2)
                
            Spacer().frame(height: 19)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.mainTextMedium16)
                .foregroundColor(.gray01)
                .kerning(-0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading) // 여기서 leading 주면 frame 내에서 vstack 자체의 위치 결정
        // allignment leading을 어디서 주느냐에 따라 구조가 달라짐
    }
    
    // MARK: - 아이디 및 비밀번호 입력 영역
    private var inputFieldsView: some View {
        VStack(spacing: 47) {
            VStack(alignment: .leading) {
                TextField(
                    "아이디",
                    text: $viewModel.loginModel.id
                )
                    .font(.mainTextRegular13)
                    .textFieldStyle(PlainTextFieldStyle())
                    .focused($focusedField, equals: .id)
                    .keyboardType(.emailAddress)
                Divider()
                    .background(focusedField == .id ? Color.green01 : Color.gray00)
            }
            .frame(height: 20)
            
            VStack(alignment: .leading) {
                SecureField(
                    "비밀번호",
                    text: $viewModel.loginModel.pw
                )
                    .font(.mainTextRegular13)
                    .textFieldStyle(PlainTextFieldStyle())
                    .focused($focusedField, equals: .pw)
                Divider()
                    .background(focusedField == .pw ? Color.green01 : Color.gray00)
            }
            .frame(height: 20)
            
            if showAutoLoginPrompt {
                Button {
                    viewModel.attemptAutoLogin()
                } label: {
                    Text("자동 로그인 시도하기")
                        .font(.mainTextRegular12)
                        .foregroundColor(.gray04)
                        .underline()
                }
            }
            
            Button {
                viewModel.login()
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
            
            if let error = viewModel.loginErrorMessage {
                Text(error)
                    .foregroundStyle(.red01)
                    .font(.mainTextMedium16)
            }

        }
    }
    
    // MARK: - 로그인 및 회원가입 영역
    private var loginButtonsView : some View {
        VStack(spacing: 16) {
            // 이메일로 회원가입
//            Button {
//                print("회원가입으로 이동")
//                
//            } label: {
//                Text("이메일로 회원가입하기")
//                    .font(.mainTextRegular12)
//                    .foregroundColor(.gray04)
//                    .underline()
//            }
            NavigationLink(destination: SignUpView()) {
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundColor(.gray04)
                    .underline()
            }

            
            // 카카오 로그인
            Button {
                viewModel.kakaoLogin()
            } label: {
//                ZStack {
//                    Rectangle()
//                        .frame(height: 45)
//                        .cornerRadius(6)
//                        .foregroundColor(Color.kakaoYellow)
//                    HStack {
//                        Spacer().frame(width: 14)
//                        Image("kakaoLogo")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 18, height: 18)
//                        Spacer()
//                        Text("카카오 로그인")
//                            .font(.mainTextMedium16)
//                        Spacer()
//                    }
//                    .frame(height: 45)
//                }
//                .padding(.horizontal, 48)
                Image(.kakaoLoginMediumNarrow)
            }
            
            
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
}

enum LoginInputFieldFocus {
    case id, pw
}

//struct LoginView_Preview: PreviewProvider {
//    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
//    static var previews: some View {
//        ForEach(devices, id: \.self) { device in
//            LoginView(viewModel: LoginViewModel())
//                .previewDevice(PreviewDevice(rawValue: device))
//                .previewDisplayName(device)
//        }
//    }
//}

#Preview {
    LoginView()
}
