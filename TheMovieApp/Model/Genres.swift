//
//  Genres.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 11.12.23.
//

import Foundation
struct Genres: Codable {
    let genres: [Genre]?
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}
