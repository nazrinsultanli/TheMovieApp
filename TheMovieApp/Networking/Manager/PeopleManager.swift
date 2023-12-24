//
//  PeopleManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 15.12.23.
//

import Foundation
class PeopleManager: PeopleUseCase {
    func getPeopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void)) {
        
        let url = PeopleEndpoint.people.rawValue + "?page=\(pageNumber)"
        
        NetworkManager.request(
            model: People.self,
            url: url) { data, errorMessage in
                
                if let errorMessage {
                    completion(nil, errorMessage)
                } else if let data {
                    completion(data, nil)
                }
            }
    }
}
