//
//  FootbalTeamService.swift
//  footballteamapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation
import SwiftUI

class FootballTeamViewModel: ObservableObject {
    @Published var footballTeams: [FootbalTeam] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let movieService = FootballTeamService()
    
    func fetchFootballTeams() {
        self.isLoading = true
        self.errorMessage = nil
        
        movieService.fetchFootbalTeams { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let teams):
                    self?.footballTeams = teams
                case .failure(let error):
                    print(error as Any)
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
