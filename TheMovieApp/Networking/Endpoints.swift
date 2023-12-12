//
//  Endpoints.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import Foundation

enum Endpoints: String {
    case popular = "movie/popular"
    case playing = "movie/now_playing"
    case topRated = "movie/top_rated"
    case upComing = "movie/upcoming"
    case people = "person/popular"
    case searchMovie = "search/movie"
    case genres = "genre/movie/list"
}
