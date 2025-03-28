//
//  MovieView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI
import Observation

struct MovieView: View {
    @AppStorage("movieTitle") private var movieTitle: String = ""
    private var viewModel: MovieViewModel = .init()
    
    var body: some View {
        VStack(alignment: .center, spacing: 56) {
            MovieCard(movieInformation: viewModel.movieModel[viewModel.currentIndex])
            movieChangeButton
            setFavoriteMovie
            appStorageValueView
        }
    }
    
    private var movieChangeButton: some View {
        HStack {
            Group {
                makeChevron(name: "chevron.left", action: viewModel.previousMovie)
                
                Spacer()
                Text("영화 바꾸기")
                    .font(.system(size: 20, weight: .regular))
                Spacer()
                
                makeChevron(name: "chevron.right", action: viewModel.nextMovie)
            }
            .foregroundStyle(Color.black)
        }
        .frame(width: 256)
        .padding(.vertical, 17) // 위아래 패딩
        .padding(.horizontal, 22) // 양옆 패딩
    }
    
    // for re-usage of chevron
    // - Parameters:
    //  - name: image name
    //  - action: button's action, @escaping for later
    // - Returns: some View type
    
    private func makeChevron(name: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
            print(viewModel.movieModel[viewModel.currentIndex])
        }, label: {
            Image(systemName: name)
                .resizable()
                .frame(width: 17.47, height: 29.73)
        })
    }
    
    private var setFavoriteMovie: some View {
        Button {
            self.movieTitle = viewModel.movieModel[viewModel.currentIndex].movieTitle
        } label: {
            Text("대표 영화로 설정")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(.black)
                .padding(.top, 21)
                .padding(.bottom, 20)
                .padding(.leading, 53)
                .padding(.trailing, 52)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.clear)
                        .stroke(Color.black, style: .init(lineWidth: 1))
                })
        }
    }
    
    private var appStorageValueView: some View {
        VStack(spacing: 17) {
            Text("@AppStorage에 저장된 영화")
                .font(.system(size: 30, weight: .regular))
                .foregroundStyle(Color.black)
            
            Text("현재 저장된 영화 : \(movieTitle)")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    MovieView()
}
