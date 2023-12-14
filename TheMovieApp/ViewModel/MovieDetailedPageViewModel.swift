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
    var data: Any?
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
                if let media = data.posterPath{
                    self?.items.append(.init(type: .media, 
                                             data: media))
                }
                if let title = data.title{
                    self?.items.append(.init(type: .title, 
                                             data: title))
                }
                if let infoOneLanguage = data.spokenLanguages?[0].englishName {
                    if let infoTwoReleaseDate = data.releaseDate {
                        if let infoThreeRating = data.voteAverage {
                            self?.items.append(.init(type: .infoThree,
                                                     data: InfoThreeModel(language: infoOneLanguage,
                                                                          releaseData: infoTwoReleaseDate,
                                                                          imdbRating: infoThreeRating)))
                        }
                    }
                }
                self?.success?()
            }
            
        }
    }
}

