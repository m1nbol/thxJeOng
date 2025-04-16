//
//  ProductCircleCard.swift
//  starbucks
//
//  Created by BoMin Lee on 4/15/25.
//

import SwiftUI

struct ProductCircleCard: View {
    let menu: MenuModel
    
    var body: some View {
        VStack(spacing: 10) {
            menu.image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            Text(menu.name)
                .font(.mainTextSemiBold13)
                .frame(alignment: .center)
        }
    }

}
