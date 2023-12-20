//
//  MovieDetailedUseCase.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 16.12.23.
//


import Foundation
protocol MovieDetailedUseCase {
    func getDetailedMovieList(
        id: Int,
        completion: @escaping((MovieDetailed?,String?)-> Void)
    )
}
