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
        manager.getMovieList(searchText: nil,
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
        if index == movi.count - 1 && (peopleData?.page ?? 0 <= peopleData?.totalPages ?? 0) {
            getSpecificMovie(endpoint: endPoint ?? .playing)
        }
    }
}
