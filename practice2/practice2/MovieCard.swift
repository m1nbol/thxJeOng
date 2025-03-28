//
//  MovieCard.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct MovieCard: View {
    let movieInformation: MovieModel
    
    init(movieInformation: MovieModel) {
        self.movieInformation = movieInformation
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            movieInformation.movieImage
            Text("\(movieInformation.movieTitle)")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.black)
            HStack {
                movieLike
                Spacer()
                Text("예매율 \(String(format: "%.1f", movieInformation.movieReservationRate))%")
                    .font(.system(size: 9, weight: .regular))
                    .foregroundStyle(.black)
            }
        }
        .frame(width: 120, height: 216)
    }
    
    private var movieLike: some View {
        HStack(spacing: 6) {
            Image(systemName: "heart.fill")
                .foregroundStyle(Color.red)
                .frame(width: 15, height: 14)
            
            Text("\(movieInformation.movieLikeCount)")
                .font(.system(size: 9, weight: .regular))
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    MovieCard(movieInformation: .init(movieImage: .init(.mickey), movieTitle: "미키17", movieLikeCount: 972, movieReservationRate: 30.8))
}
