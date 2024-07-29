//
//  FootbalTeamService.swift
//  footballteamapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation

struct FootbalTeam: Identifiable, Codable {
    let id: UUID = UUID()
    let idTeam: String
    let strTeam, intFormedYear, strLeague, strStadium, strDescriptionEn: String?
    let strBadge, strCountry, strLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case idTeam
        case strTeam, intFormedYear, strLeague, strStadium, strDescriptionEn
        case strBadge, strCountry, strLocation
    }
}
