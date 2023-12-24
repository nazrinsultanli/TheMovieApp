//
//  HomePageManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 13.12.23.
//

import Foundation

class HomePageManager: MovieListUseCase {
    func getMovieList(pageNumber: Int, searchText: String?, endPoint: MovieEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkManager.request(model: Movie.self,
                               url: endPoint.rawValue,
                               completion: completion)
    }
    
   
    
    
    
    
}
