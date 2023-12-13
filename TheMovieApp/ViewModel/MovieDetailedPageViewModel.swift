//
//  MovieDetailedPageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 14.12.23.
//
import Foundation
enum MovieDetailItemType {
    case media
    case title
    case infoThree
    case segment
    case details
    case trailer
    case cast
    case shots
}
struct MovieDetailedModel {
    let type: MovieDetailItemType
    var data: Any
}

struct InfoThreeModel {
    let language: String
    let releaseData: String
    let imdbRating: Double
}
class MovieDetailedPageViewModel {
    var success: (() -> Void)?
    var error: ((String) -> Void)?
        
    var items = [MovieDetailedModel]()
    
    
    

    
    func getDetailed(id: Int) {
        let path = Endpoints.detailedMovie.rawValue + "\(id)"
        NetworkManager.request(
            model: MovieDetailed.self,
            url: path
        ) {[weak self] data, errorMessage in
           
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                guard let media = data.posterPath else  {return}
                self?.items.append(.init(type: .media, data: media))
                
                guard let title = data.title else  {return}
                self?.items.append(.init(type: .title, data: title))
                
                guard let infoOneLanguage = data.originalLanguage else  {return}
                guard let infoTwoReleaseDate = data.releaseDate else  {return}
                guard let infoThreeRating = data.voteAverage else  {return}
                self?.items.append(.init(type: .infoThree, data: InfoThreeModel(language: infoOneLanguage,
                                                                            releaseData: infoTwoReleaseDate,
                                                                            imdbRating: infoThreeRating)))
                
                
                self?.success?()
            }
 
        }
    }
}

