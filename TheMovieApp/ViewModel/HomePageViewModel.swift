//
//  HomePageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import Foundation

struct homeModel {
    let title: String
    let result: [Result]
}

class HomePageViewModel {

    var items = [homeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
        
    func getItems() {
        getMovies(endpoint: Endpoints.playing, title: "Now Playing")
        getMovies(endpoint: Endpoints.popular, title: "Popular")
        getMovies(endpoint: Endpoints.topRated, title: "Top Rated")
        getMovies(endpoint: Endpoints.upComing, title: "Up Coming")
    }
    func getMovies(endpoint: Endpoints, title: String) {
        NetworkManager.request(
            model: Movie.self,
            url: endpoint.rawValue
        ) {[weak self] data, errorMessage in
           
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                guard let results = data.results else  {return}
                self?.items.append(.init(title: title, result: results))
                self?.success?()
            }
 
        }
    }
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
