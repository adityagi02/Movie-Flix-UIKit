//
//  Movie.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 19/04/22.
//

import Foundation


// MARK: - Result
struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
