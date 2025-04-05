//
//  WhatsNewCard.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

struct WhatsNewCard: View {
    let ad: AdvertisementModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ad.image
//                .resizable()
                .scaledToFit()
                .frame(width: 240)
            Text(ad.title)
                .font(.mainTextSemiBold18)
                .frame(maxWidth: 240, alignment: .leading)
                .lineLimit(1)
                .foregroundStyle(.black02)
            Text(ad.content)
                .font(.mainTextSemiBold13)
                .frame(maxWidth: 240, alignment: .leading)
                .lineLimit(2)
                .foregroundStyle(.gray03)
        }
//        .border(.mint, width: 2.0)
    }
}

#Preview {
    WhatsNewCard(ad: AdvertisementModel(image: Image(.whatsNewFirst), title: "25년 3월 일회용컵 없는 날 캠페인", content: "매월 10일은 일회용컵 없는 날! 스타벅스 에코매장에서 개인컵 및 다회용컵을 이용하세요."))
}

