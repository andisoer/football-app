//
//  MovieService.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation
import Alamofire

class MovieService {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1"
        
        let headers: HTTPHeaders? = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDQyMDFkZTNhNDhhOWVhZGJhN2U4MmJkNTc5MDM2YyIsIm5iZiI6MTcyMTg4NzU1My44ODAwMzcsInN1YiI6IjVkYzE3OTdiZjFiNTcxMDAxM2VhOTYzNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3byEP4GsxLsuyPTkbPeaXeo1YZZ5yeWkLC8N0V6KX8U",
            "accept": "application/json",
        ]
        
        AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: MovieResponse.self) {
            response in
            switch response.result {
            case .success(let movieResponse):
                completion(.success(movieResponse.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
