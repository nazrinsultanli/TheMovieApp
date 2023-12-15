//
//  MovieEndpoint.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 15.12.23.
//

import Foundation

enum MovieEndpoint: String {
    case popular = "movie/popular"
    case playing = "movie/now_playing"
    case topRated = "movie/top_rated"
    case upComing = "movie/upcoming"
    case searchMovie = "search/movie"
}
