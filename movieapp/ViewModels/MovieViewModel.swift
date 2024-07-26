//
//  MovieViewModel.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let movieService = MovieService()
    
    func fetchMovies() {
        self.isLoading = true
        self.errorMessage = nil
        
        movieService.fetchFootbalTeams { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    print(error as Any)
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
