//
//  SeeAllPageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 24.12.23.
//

import Foundation
class SeeAllPageViewModel {
    var specificMovie: Movie?
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var movies = [MovieResult]()
    var endPoint: MovieEndpoint?
    
    init(endPoint: MovieEndpoint) {
        self.endPoint = endPoint
    }
    func getSpecificMovie(endpoint: MovieEndpoint) {
        manager.getMovieList(pageNumber: (specificMovie?.page ?? 0) + 1,
                             searchText: nil,
                             endPoint: endpoint){ data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                guard let result = data.results else {return}
                self.movies = result
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == movies.count - 1 && (specificMovie?.page ?? 0 <= specificMovie?.totalPages ?? 0) {
            getSpecificMovie(endpoint: endPoint ?? .playing)
        }
    }
}
