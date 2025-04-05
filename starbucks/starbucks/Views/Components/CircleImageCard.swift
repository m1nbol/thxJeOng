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
    
    var body: some View {
        VStack(spacing: 10) {
            menu.image
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            Text(menu.name)
                .font(.mainTextLight14)
                .frame(alignment: .center)
        }
    }
}
