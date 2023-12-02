//
//  HomePageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import UIKit

class HomePageViewController: UIViewController {
var viewModel = HomePageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPopularMovie()
        viewModel.success = { [weak self] in
            print("good")
        }
    }

}
