//
//  MovieRowView.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Article
    
    var body: some View {
        HStack {
            if movie.urlToImage != nil {
                AsyncImage(url: URL(string: movie.urlToImage!)) { phase in
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
            }
    
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                if movie.description != nil {
                    Text(movie.description!)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                Text("\(movie.author)").font(.caption)
            }
            .padding(.leading, 8)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Article(author: "JK Rowling", title: "Inside Out 2", description: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.", url: "2024-07-24T07:32:00Z", urlToImage: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg", publishedAt: "https://news.google.com/rss/articles/CBMifWh0dHBzOi8vd3d3LnJldXRlcnMuY29tL3dvcmxkL2FzaWEtcGFjaWZpYy9zYXVyeWEtYWlybGluZXMtcGxhbmUtY3Jhc2hlcy1kdXJpbmctdGFrZW9mZi1uZXBhbC1rYXRobWFuZHUtcG9zdC1zYXlzLTIwMjQtMDctMjQv0gEA?oc=5"))
    }
}
