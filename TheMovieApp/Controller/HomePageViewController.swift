//
//  HomePageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import UIKit

class HomePageViewController: UIViewController {
    var viewModel = HomePageViewModel()
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .green
        table.register(HomePageTableViewCell.self, forCellReuseIdentifier: HomePageTableViewCell.reuseID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie"
        
        setUpTable()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getSpecificMovies(endPoint: Endpoints.popular) { [weak self] _ in
            
            self?.tableView.reloadData()
        }
    }
    
     func setUpTable() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
        
    }
}


extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "popular"
        case 1:
            return "New Products"
        case 2:
            return "Discounted Products"
        default:
            return "-----"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.reuseID, for: indexPath) as! HomePageTableViewCell
            cell.movies =  viewModel.movieResults
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
