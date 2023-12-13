//
//  MovieListUseCase.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 13.12.23.
//

import Foundation
protocol MovieListUseCase {
    func getMovieList(searchText: String?,
                      endPoint: Endpoints, completion: @escaping((Movie?,String?)-> Void))
}
