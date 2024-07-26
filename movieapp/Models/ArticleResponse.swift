//
//  MovieResponse.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation

struct ArticleResponse: Codable {
    let teams: [Article]
    
    enum CodingKeys: String, CodingKey {
        case teams
    }
}
