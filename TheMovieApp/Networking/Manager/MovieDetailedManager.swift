//
//  MovieDetailedManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 16.12.23.
//

import Foundation
class MovieDetailedManager: MovieDetailedUseCase {
    func getDetailedMovieList(id: Int, completion: @escaping ((MovieDetailed?, String?) -> Void)) {
        let path = MovieEndpoint.detailedMovie.rawValue + "\(id)"
        NetworkManager.request(
            model: MovieDetailed.self,
            url: path,
            completion: completion
        )
    }
}
