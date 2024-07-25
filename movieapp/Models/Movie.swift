//
//  Movie.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let voteAverage: Double
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
    }
}
