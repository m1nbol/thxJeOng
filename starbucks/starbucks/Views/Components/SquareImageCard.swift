//
//  SquareImageCard.swift
//  starbucks
//
//  Created by BoMin Lee on 4/15/25.
//

import SwiftUI

struct SquareImageCard: View {
    let menu: MenuModel
//    var fontSize: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            menu.image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            Spacer()
            Text(menu.name.forceCharWrapping)
                .font(.mainTextSemiBold14)
                .frame(alignment: .leading)
        }
    }
}
