//
//  PeoplesMoviesPageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.01.24.
//

import Foundation
class PeoplesMoviesPageViewModel {
    var selectedPeople = 0
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    private let manager = PeopleMoviesManager()
    var items = [PeopleMovieCredits]()
    
    func getPeopleMovieCredits() {
        manager.getPeopleMovieCredits(id: selectedPeople) { [weak self] data, errorMassage in
            if let errorMassage {
                self?.error?(errorMassage)
            } else if let data {
                self?.items.append(contentsOf: data.cast ?? [])
                self?.success?()
            }
        }
    }
}
