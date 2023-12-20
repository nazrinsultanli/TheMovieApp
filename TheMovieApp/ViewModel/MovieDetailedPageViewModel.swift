//
//  MovieDetailedPageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 14.12.23.
//
import Foundation



enum MovieDetailItemType {
    case media(String?)
    case title(String?)
    case infoThree(InfoThreeModel?)
    case segment
    case details(SegmentDetailsModel?)
    case trailer
    case cast
    case shots
}

enum SegmentNames: String , CaseIterable {
    case details = "Details"
    case trailer = "Trailers"
    case cast = "Cast"
    case shots = "Shots"
}
struct MovieDetailedModel {
    let type: MovieDetailItemType

    var height: CGFloat
}

struct InfoThreeModel {
    let language: String
    let releaseData: String
    let imdbRating: Double
}
struct SegmentDetailsModel {
    let genre: [Genre]
    let status: String
}

class MovieDetailedPageViewModel {
    var selectedMovieID: Int
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var items = [MovieDetailedModel]()
    var allItems = [MovieDetailedModel]()
    var selectedSegment: String?
    private let manager = MovieDetailedManager()
    
    init(selectedMovieID: Int) {
        self.selectedMovieID = selectedMovieID
    }
    
    func getDetailed() {
        manager.getDetailedMovieList(id: selectedMovieID) {[weak self] data, errorMessage in
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                if let media = data.posterPath{
                    self?.items.append(.init(type: .media (media),
                                             height: 400))
                }
                if let title = data.title{
                    self?.items.append(.init(type: .title(title),
                                             height: 50))
                }
                if let infoOneLanguage = data.spokenLanguages?[0].englishName {
                    if let infoTwoReleaseDate = data.releaseDate {
                        if let infoThreeRating = data.voteAverage {
                            self?.items.append(.init(type: .infoThree(InfoThreeModel(language: infoOneLanguage,
                                                                                     releaseData: infoTwoReleaseDate,
                                                                                     imdbRating: infoThreeRating)),
                                                     height: 50))
                        }
                    }
                }
                self?.items.append(.init(type: .segment, height: 50))
                
                if let detailsOneGenre = data.genres {
                    if let detailsOneStatus = data.status {
                        self?.items.append(.init(type: .details(SegmentDetailsModel(genre: detailsOneGenre,
                                                                                    status: detailsOneStatus)),
                                                 height: 100))
                    }
                }
                self?.allItems = self?.items ?? []
                self?.success?()
            }
        }
    }
    
    
//    func didSelectSegment(_ segment: String) {
//        selectedSegment = segment
//        
//       
//        
//      //  filterItems()
//        success?()
//    }
    
//    private func filterItems() {
//        items = allItems
//        guard let selectedSegment = selectedSegment else {
//            // No selected segment, do nothing
//            return
//        }
//
//        items = items.filter { item in
//            switch item.type {
//            case .segment:
//                // Keep the segment item
//                return true
//            case .details, .trailer, .cast, .shots:
//                // Check if the item type matches the selected segment
//                return item.type == itemTypeForSegment(selectedSegment)
//            default:
//                // For other item types, keep them
//                return true
//            }
//        }
//    }
//
//    private func itemTypeForSegment(_ segment: String) -> MovieDetailItemType? {
//        switch segment {
//        case SegmentNames.details.rawValue:
//            return .details(SegmentDetailsModel?)
//        case SegmentNames.trailer.rawValue:
//            return .trailer
//        case SegmentNames.cast.rawValue:
//            return .cast
//        case SegmentNames.shots.rawValue:
//            return .shots
//        default:
//            return nil
//        }
//    }

}



