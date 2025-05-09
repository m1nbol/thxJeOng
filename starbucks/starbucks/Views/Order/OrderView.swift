//
//  OrderView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/2/25.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel()
    
    @State private var selectedSegment: MenuSegment = .all
    @State private var selectedTypeSegment: MenuTypeSegment = .drink
    
    @State private var showStoreSelectionSheet = false
    
    @Namespace private var animationNamespace
    
    var body: some View {
        VStack {
            topSegment
            Divider()
            menuList
            storeSelection
        }
    }
    
    private var topSegment: some View {
        VStack(spacing: 6) {
            // Order 타이틀
            HStack {
                Text("Order")
                    .font(.mainTextBold24)
                    .padding(.leading, 24)
                Spacer()
            }
            
            // 세그먼트 선택
            HStack {
                ForEach(MenuSegment.allCases) { segment in
                    Button {
                        withAnimation(.easeInOut) {
                            selectedSegment = segment
                        }
                    } label: {
                        VStack {
                            if segment == .wholeCake {
                                HStack {
                                    Image(.wholeCake)
                                    Text(segment.rawValue)
                                        .font(.mainTextBold16)
                                        .foregroundColor(.green01)
                                        .padding(.vertical, 13)
                                        .lineLimit(1)
                                }
                            } else {
                                Text(segment.rawValue)
                                    .font(.mainTextBold16)
                                    .foregroundColor(selectedSegment == segment ? .black01 : .gray04)
                                    .padding(.vertical, 13)
                            }
                            if selectedSegment == segment {
                                Rectangle()
                                    .fill(Color.green01)
                                    .frame(height: 3)
                                    .matchedGeometryEffect(id: "segment", in: animationNamespace)
                                    
                            } else {
                                Color.clear.frame(height: 3)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .background(
                Color.white
                    .shadow(color: .black.opacity(0.15), radius: 1.5, x: 0, y: 3)
            )
            
            // 메뉴 종류 선택 (종류가 많아지면 스크롤 할 일이 생길 것 같아서 ScrollView도)
//            ScrollView(.horizontal) {
//                LazyHStack {
//                    ForEach(MenuTypeSegment.allCases) { type in
//                        Button {
//                            withAnimation(.easeInOut) {
//                                selectedTypeSegment = type
//                            }
//                        } label: {
//                            HStack {
//                                Text(type.rawValue)
//                                    .font(.mainTextSemiBold16)
//                                    .foregroundColor(selectedTypeSegment == type ? .black01 : .gray04)
//                                Image(.new)
//                            }
//                            .padding(.vertical, 18)
//                        }
//                    }
//                    Spacer()
//                }
//                .border(.red)
//            }
//            .padding(.leading, 23)
            HStack {
                ForEach(MenuTypeSegment.allCases) { type in
                    Button {
                        withAnimation(.easeInOut) {
                            selectedTypeSegment = type
                        }
                    } label: {
                        HStack {
                            Text(type.rawValue)
                                .font(.mainTextSemiBold16)
                                .foregroundColor(selectedTypeSegment == type ? .black01 : .gray04)
                            Image(.new)
                        }
                        .padding(.vertical, 18)
                    }
                }
                Spacer()
            }
            .padding(.leading, 23)
        }
    }
    
    private var menuList: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 26) {
                ForEach(viewModel.menuList) { menu in
                    OrderMenuRow(orderMenu: menu)
                }
            }
            .padding(.top, 19)
            .padding(.horizontal, 23)
        }
    }
    
    private var storeSelection: some View {
        VStack(spacing: 10) {
            Button {
                showStoreSelectionSheet = true
            } label: {
                HStack {
                    Text("주문할 매장을 선택해 주세요")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.white)
                }
            }
            .sheet(isPresented: $showStoreSelectionSheet) {
                OrderSheetView()
            }
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray06)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
//        .safeAreaPadding(.bottom) // 차이 없음(탭바)
        .frame(maxWidth: .infinity)
        .background(.black02)
    }
}

#Preview {
    OrderView()
}
