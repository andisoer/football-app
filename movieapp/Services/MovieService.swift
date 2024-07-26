//
//  MovieService.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation
import Alamofire

class MovieService {
    func fetchMovies(completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = "https://newsapi.org/v2/top-headlines?country=id&page=1"
        
        let headers: HTTPHeaders? = [
            "Authorization": "c09201b8a9b14af89caf00dac49acf0a",
        ]
        
        AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: ArticleResponse.self) {
            response in
            switch response.result {
            case .success(let movieResponse):
                completion(.success(movieResponse.articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
