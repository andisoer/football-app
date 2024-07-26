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
            if (movie.strBadge != nil) {
                AsyncImage(url: URL(string: movie.strBadge!)) { phase in
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
                if (movie.strTeam != nil) {
                    Text(movie.strTeam!)
                        .font(.headline)
                }
               
                if (movie.strLocation != nil) {
                    Text(movie.strLocation!)
                        .font(.caption)
                }
            }
            .padding(.leading, 8)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Article(idTeam: "0", strTeam: nil, intFormedYear: nil, strLeague: nil, strStadium: nil, strDescriptionEn: nil, strBadge: nil, strCountry: nil, strLocation: nil))
    }
}
