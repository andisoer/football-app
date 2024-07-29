//
//  FootbalTeamService.swift
//  footballteamapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation

struct FootbalTeamResponse: Codable {
    let teams: [FootbalTeam]

    enum CodingKeys: String, CodingKey {
        case teams
    }
}
