//
//  HomePageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import Foundation

class HomePageViewModel {
   // static let shared = HomePageViewModel()
    
//    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    var movieResults: [Result] = [Result]()
    func getSpecificMovies(endPoint: Endpoints, completion: @escaping ([Result]?) -> Void) {
        NetworkManager.request(
            model: Movie.self,
            url: endPoint.rawValue
        ) {[weak self] data, errorMessage in
           
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                guard let results = data.results else  {return}
                self?.movieResults = results
                completion(self?.movieResults)
//                self.movieResults = results
//                self.success?()
            }
 
        }
    }
    
    /*
    var popularMovies = [Result]()
    func getPopularMovie() {
        NetworkManager.request(model: Movie.self,
                               url: Endpoints.popular.rawValue) {data, errorMessage in
            print(Endpoints.popular.rawValue)
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                guard let results = data.results else  {return}
                self.popularMovies = results
                self.success?()
            }
 
        }
    }
     */
}



/*
 func createNewItemWithDictionary() {
     let postModel: Parameters = ["userId": 212,
                                  "id": 21,
                                  "title": "naz",
                                  "body": "asasasa"]
     NetworkManager.request(model: Post.self,
                             url: "posts",
                            method: .post,
                            parameters: postModel,
                            encoding: JSONEncoding.default) { item, errorMessage in
         
         if let errorMessage = errorMessage {
             self.error?(errorMessage)
         } else if let item{
             self.items.insert(item, at: 0)
             self.success?()
         }
     }
 }
 */
