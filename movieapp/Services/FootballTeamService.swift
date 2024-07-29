//
//  FootbalTeamService.swift
//  footballteamapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation
import Alamofire

class FootballTeamService {
    func fetchFootbalTeams(completion: @escaping (Result<[FootbalTeam], Error>) -> Void) {
        let url = "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=Indonesian%20Super%20League"
        
        AF.request(url, method: .get).validate().responseDecodable(of: FootbalTeamResponse.self) {
            response in
            switch response.result {
            case .success(let footbalTeamResponse):
                completion(.success(footbalTeamResponse.teams))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
