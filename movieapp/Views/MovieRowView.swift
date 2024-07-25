//
//  MovieRowView.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")) { phase in
                switch phase {
                case .empty:
                    ProgressView().frame(width: 70, height: 70)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .cornerRadius(8)
                case .failure: Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
    
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .font(.subheadline)
                    .lineLimit(1)
                Text("Rating: \(movie.voteAverage, specifier: "%.1f")").font(.caption)
            }
            .padding(.leading, 8)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie(id: 1022789, title: "Inside Out 2", overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.", voteAverage: 7.6, posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg"))
    }
}
