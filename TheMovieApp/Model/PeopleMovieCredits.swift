//
//  PeopleMovieCredits.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.01.24.
//

import Foundation

// MARK: - Movie
struct PeopleMovie: Codable {
    let cast, crew: [PeopleMovieCredits]?
    let id: Int?
}
// MARK: - PeopleMovieCredits
struct PeopleMovieCredits: Codable, TopImageButtonLabelCellProtocol {

    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department: Department?
    let job: Job?

    var titleString: String {
        originalTitle ?? ""
    }
    
    var imageString: String {
        posterPath ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

enum Department: String, Codable {
    case directing = "Directing"
    case production = "Production"
    case writing = "Writing"
}

enum Job: String, Codable {
    case director = "Director"
    case producer = "Producer"
    case writer = "Writer"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
}
