//
//  HomePageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import UIKit

class HomePageViewController: UIViewController {
    var viewModel = HomePageViewModel()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
        
    }()
    

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.register(HomePageTableViewCell.self, forCellReuseIdentifier: HomePageTableViewCell.reuseID)
        table.register(SectionHeaderView.self, forHeaderFooterViewReuseIdentifier: SectionHeaderView.reuseID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Movie"
        view.backgroundColor = .white
        setUpTable()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"), style: .done, target: nil, action: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getPopularMovies() { [weak self] _ in
            
            self?.tableView.reloadData()
        }
        viewModel.getNowPlayingMovies() { [weak self] _ in
            
            self?.tableView.reloadData()
        }
        viewModel.getUpComingMovies() { [weak self] _ in
            
            self?.tableView.reloadData()
        }
        viewModel.getTopRatedMovies() { [weak self] _ in
            
            self?.tableView.reloadData()
        }
    }
    
     func setUpTable() {
         view.addSubview(titleLabel)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -24),
            //titleLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 36),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
        
    }
}


extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Popular"
        case 1:
            return "Now playing"
        case 2:
            return "Top rated"
        case 3:
            return "Upcoming"
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
            cell.movies =  viewModel.popularMovies
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.reuseID, for: indexPath) as! HomePageTableViewCell
            cell.movies =  viewModel.nowPlayingMovies
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.reuseID, for: indexPath) as! HomePageTableViewCell
            cell.movies =  viewModel.topRatedMovies
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.reuseID, for: indexPath) as! HomePageTableViewCell
            cell.movies =  viewModel.upComingMovies
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        280
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          70 // Set the desired height for the section header
      }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.reuseID) as! SectionHeaderView
            headerView.titleLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
            headerView.seeAllButton.tag = section
            headerView.seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped(_:)), for: .touchUpInside)
            return headerView
        }

        @objc func seeAllButtonTapped(_ sender: UIButton) {
            // Handle "See All" button tap based on the section
            let section = sender.tag
            print("See All button tapped for section \(section)")
            // You can perform the necessary action, e.g., navigate to a new view controller
        }
}
