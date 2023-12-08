//
//  People.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import Foundation
import Foundation

// MARK: - Movie
struct People: Codable {
    let page: Int?
    let results: [PeopleResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PeopleResult: Codable , TopImageButtonLabelCellProtocol{
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: KnownForDepartment?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let knownFor: [KnownFor]?
    
    var titleString: String {
        name ?? ""
    }
    
    var imageString: String {
        profilePath ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let title: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview, posterPath: String?
    let mediaType: MediaType?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
    case ja = "ja"
    case ko = "ko"
    case te = "te"
    case zh = "zh"
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case directing = "Directing"
}
