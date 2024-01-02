//
//  PeopleMoviesManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.01.24.
//

import Foundation
class PeopleMoviesManager: PeopleMoviesUseCase {
    func getPeopleMovieCredits(id: Int, completion: @escaping ((PeopleMovie?, String?) -> Void)) {
        let path = PeopleEndpoint.peopleMovieCredits.rawValue + "\(id)" + "/movie_credits"
        NetworkManager.request(
            model: PeopleMovie.self,
            url: path, completion: completion)
    }
    
}
