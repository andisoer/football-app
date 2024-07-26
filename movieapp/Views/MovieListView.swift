//
//  MovieListView.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error :\(errorMessage)")
                } else {
                    List(viewModel.movies) { movie in
                        MovieRowView(movie: movie)
                    }.listStyle(PlainListStyle())
                }
            }
            .onAppear {
                viewModel.fetchMovies()
            }
            .navigationTitle("Football Teams")
        }
    }
}

#Preview {
    MovieListView()
}
