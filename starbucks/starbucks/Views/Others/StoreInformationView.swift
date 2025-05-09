//
//  StoreInformationView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/29/25.
//

import SwiftUI

struct StoreInformationView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedSegment: StoreInformationSegment = .findStore
    @Namespace private var animationNamespace
    
    var body: some View {
        VStack(spacing: 17) {
            segmentBar
                .padding(.top, 20)
            MapContainerView(showFocusButton: true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("매장 찾기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
        }
    }
    
    private var segmentBar: some View {
        HStack(spacing: 40) {
            ForEach(StoreInformationSegment.allCases) { segment in
                Button {
                    withAnimation(.easeInOut) {
                        selectedSegment = segment
                    }
                } label: {
                    VStack {
                        Text(segment.rawValue)
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(.black)
                        
                        if selectedSegment == segment {
                            Capsule()
                                .fill(Color.brown02)
                                .frame(width: 120, height: 5)
                                .matchedGeometryEffect(id: "segmentBar", in: animationNamespace)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(width: 120, height: 5)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

enum StoreInformationSegment: String, CaseIterable, Identifiable {
    case findStore = "매장 찾기"
    case findRoute = "길찾기"
    
    var id: String { rawValue }
}
