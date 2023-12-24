//
//  SeeAllCoordinator.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 24.12.23.
//

import Foundation
import UIKit
class SeeAllCoordinator: Coordinator {
    var navigationController: UINavigationController
    var endpoint: MovieEndpoint
    
    init(navigationController: UINavigationController, endpoint: MovieEndpoint) {
        self.navigationController = navigationController
        self.endpoint = endpoint
    }
    func start() {
        let controller = SeeAllPageViewController(viewModel: .init(endPoint: endpoint))
        navigationController.show(controller, sender: nil)
    }
}
