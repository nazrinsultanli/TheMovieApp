//
//  HomePageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import UIKit

class HomePageViewController: UIViewController {
    var viewModel = HomePageViewModel()

    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(HomePageCollectionViewCell.self, forCellWithReuseIdentifier: HomePageCollectionViewCell.reuseID)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpConstraints()
        configureViewModel()
    }
    
    func configureUI() {
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"), 
            style: .done, 
            target: self,
            action:  #selector(searchButton)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            style: .done,
            target: nil,
            action: nil)
    }
    
    func configureViewModel() {
        viewModel.getItems()
        viewModel.error = {errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            self.collectionView.reloadData()
        }
    }
    
    func setUpConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
    }
}


extension HomePageViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCollectionViewCell.reuseID, for: indexPath) as! HomePageCollectionViewCell
        let item = viewModel.items[indexPath.row]
        cell.delegate = self
        cell.configure(title: item.title, movies: item.result)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 296)
    }
    
  
    @objc func searchButton() {
        let cv = SearchfromHomeViewController()
        navigationController?.show(cv, sender: nil)
    }
    

}


extension HomePageViewController: HomePageCollectionViewCellDelegate {
    func didSelectMovie(_ movie: MovieResult) {
           let movieDetailVC = MovieDetailedPageViewController()
           // Pass the selected movie to the detail view controller
           movieDetailVC.selectedMovie = movie
           navigationController?.pushViewController(movieDetailVC, animated: true)
        //navigationController?.show(movieDetailVC, sender: nil)
       }
}
