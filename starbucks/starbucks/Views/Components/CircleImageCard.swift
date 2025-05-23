//
//  CircleImageCard.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation
import SwiftUI

struct CircleImageCard: View {
    let menu: MenuModel
    var fontSize: Int
    
    var body: some View {
        VStack(spacing: 10) {
            menu.image
                .resizable()
                .scaledToFit()
                // .frame(width: 130, height: 130) // frame 고정되면 안 되고 상위뷰에서 결정시켜야 함
                .frame(maxWidth: .infinity)
            if fontSize == 14 {
                Text(menu.name)
                .font(.mainTextSemiBold14)
                .frame(alignment: .center)
            } else if fontSize == 13 {
                Text(menu.name)
                .font(.mainTextSemiBold13)
                .frame(alignment: .center)
            } else {
                Text(menu.name)
                .font(.mainTextLight14)
                .frame(alignment: .center)
            }
        }
    }
}

#Preview {
    CircleImageCard(menu: MenuModel(id: 1, name: "에스프레소", image: Image(.espressoConpannaCircle)), fontSize: 14)
}
