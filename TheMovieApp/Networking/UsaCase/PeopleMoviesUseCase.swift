//
//  PeopleMoviesUseCase.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.01.24.
//

import Foundation
protocol PeopleMoviesUseCase {
    func getPeopleMovieCredits(
        id: Int,
        completion: @escaping((PeopleMovie?, String?)-> Void)
    )
}
