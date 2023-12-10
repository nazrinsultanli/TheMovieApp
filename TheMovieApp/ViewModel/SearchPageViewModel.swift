//
//  SearchPageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 10.12.23.
//

import Foundation


class SearchPageViewModel {
    var items = [MovieResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getSearchedMovies( searchText: String) {
        let path = Endpoints.searchMovie.rawValue + "?query=\(searchText)"
        
        NetworkManager.request(
            model: Movie.self,
            url: path) {[weak self] data, errorMessage in
           
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                guard let results = data.results else  {return}
                self?.items = results
                self?.success?()
            }
 
        }
    }
}
