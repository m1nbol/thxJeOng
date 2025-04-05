//
//  HomeModel.swift
//  starbucks
//
//  Created by BoMin Lee on 4/5/25.
//

import Foundation

struct HomeModel {
    let maxStarCount: Int = 12
    var starCount: Int = 1
    var starPercentage: CGFloat {
        CGFloat(Double(starCount)/Double(maxStarCount))
    }
    
    
}
