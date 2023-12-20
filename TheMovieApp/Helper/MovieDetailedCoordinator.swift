//
//  MovieDetailedCoordinator.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 20.12.23.
//

import Foundation
import UIKit
class MovieDetailedCoordinator: Coordinator {
    var navigationController: UINavigationController
    var movieID: Int
    
    init(navigationController: UINavigationController, movieID: Int) {
        self.navigationController = navigationController
        self.movieID = movieID
    }
 
    func start() {
        let controller = MovieDetailedPageViewController(viewModel: .init(selectedMovieID: movieID))
        navigationController.show(controller, sender: nil)
    }
}
