//
//  Movie.swift
//  movieapp
//
//  Created by Andi Surya on 7/25/24.
//

import Foundation

struct Article: Identifiable, Codable {
    let id: UUID = UUID()
    let author: String
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
   

    enum CodingKeys: String, CodingKey {
        case author, title, url
        case description = "description"
        case urlToImage = "urlToImage"
        case publishedAt
    }
}
