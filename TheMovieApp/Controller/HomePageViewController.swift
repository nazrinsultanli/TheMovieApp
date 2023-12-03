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
        view.backgroundColor = .red
        
        setUpTable()
        viewModel.getPopularMovie()
        viewModel.success = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setUpTable() {
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.reuseID, for: indexPath) as! HomePageTableViewCell
        cell.configure(item: viewModel.popularMovies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
