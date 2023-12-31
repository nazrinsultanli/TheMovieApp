//
//  MovieListUseCase.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 13.12.23.
//

import Foundation
protocol MovieListUseCase {
    func getMovieList(pageNumber: Int,
                      searchText: String?,
                      endPoint: MovieEndpoint, completion: @escaping((Movie?,String?)-> Void))
}
