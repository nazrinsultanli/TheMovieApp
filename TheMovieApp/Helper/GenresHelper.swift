//
//  GenresHelper.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 12.12.23.
//

import Foundation
class GenresHelper {
    static let shared = GenresHelper()
    
    var genres = [Genre]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    private init() {}


    func getGenres () {
        NetworkManager.request(
            model: Genres.self,
            url: Endpoints.genres.rawValue
        ) {[weak self] data, errorMessage in
           
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                guard let results = data.genres else  {return}
                self?.genres = results
                self?.success?()
            }
        }
    }
    
    func initializeArray() {
        getGenres()
        error = {errorMessage in
            print("Error:\(errorMessage)")
        }
        success =  {
        }
    }
}
