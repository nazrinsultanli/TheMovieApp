//
//  HomePageManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 13.12.23.
//

import Foundation

class HomePageManager: MovieListUseCase {
    func getMovieList(searchText: String?, endPoint: Endpoints, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkManager.request(model: Movie.self,
                               url: endPoint.rawValue,
                               completion: completion)
    }
}
