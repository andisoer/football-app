//
//  MovieService.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation
import Alamofire

class MovieService {
    func fetchFootbalTeams(completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=Indonesian%20Super%20League"
        
        AF.request(url, method: .get).validate().responseDecodable(of: ArticleResponse.self) {
            response in
            switch response.result {
            case .success(let movieResponse):
                completion(.success(movieResponse.teams))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
