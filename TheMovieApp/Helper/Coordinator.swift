//
//  Coordinator.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 20.12.23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
