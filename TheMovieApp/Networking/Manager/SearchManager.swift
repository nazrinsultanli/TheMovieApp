//
//  SearchManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 13.12.23.
//

import Foundation

class SearchManager : MovieListUseCase {
    func getMovieList(searchText: String?, endPoint: MovieEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = MovieEndpoint.searchMovie.rawValue + "?query=\(searchText ?? "")"
        
        NetworkManager.request(
            model: Movie.self,
            url: path, completion: completion)
    }
}
