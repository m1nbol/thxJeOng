//
//  MovieViewModel.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import Foundation
import SwiftUI

@Observable
class MovieViewModel {
    var currentIndex: Int = 0
    
    let movieModel: [MovieModel] = [
        .init(movieImage: .init(.mickey), movieTitle: "미키17", movieLikeCount: 972, movieReservationRate: 30.8),
        .init(movieImage: .init(.toystory), movieTitle: "토이스토리", movieLikeCount: 999, movieReservationRate: 99.8),
        .init(movieImage: .init(.brutalist), movieTitle: "브루탈리스트", movieLikeCount: 302, movieReservationRate: 24.8),
        .init(movieImage: .init(.snowwhite), movieTitle: "백설공주", movieLikeCount: 302, movieReservationRate: 3.8),
        .init(movieImage: .init(.whiplash), movieTitle: "위플래쉬", movieLikeCount: 604, movieReservationRate: 62.2),
        .init(movieImage: .init(.conclave), movieTitle: "콘클라베", movieLikeCount: 392, movieReservationRate: 43.9),
        .init(movieImage: .init(.thefall), movieTitle: "더폴", movieLikeCount: 30, movieReservationRate: 2.1)
    ]
    
    public func previousMovie() {
        currentIndex = (currentIndex - 1 + movieModel.count) % movieModel.count
    }
    
    public func nextMovie() {
        currentIndex = (currentIndex + 1) % movieModel.count
    }
}
