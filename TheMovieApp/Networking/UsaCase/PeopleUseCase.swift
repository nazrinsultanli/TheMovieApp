//
//  PeopleUseCase.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 15.12.23.
//

import Foundation
protocol PeopleUseCase {
    func getPeopleList(pageNumber: Int, completion: @escaping((People?,String?) ->Void))
}
