//
//  PeoplePageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import Foundation

class PeoplePageViewModel {
    var items = [PeopleResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleList() {
        NetworkManager.request(
            model: People.self,
            url: Endpoints.people.rawValue
        ) {[weak self] data, errorMessage in
           
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                guard let results = data.results else  {return}
                self?.items.append(contentsOf: results)
                self?.success?()
            }
 
        }
    }
}
