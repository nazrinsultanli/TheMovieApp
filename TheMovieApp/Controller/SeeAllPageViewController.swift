//
//  SeeAllPageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 19.12.23.
//

import UIKit

class SeeAllPageViewController: UIViewController {
    var viewModel = HomePageViewModel()
    let refreshControl = UIRefreshControl()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
       
        
        collection.register(TopImageButtonLabelCell.self, forCellWithReuseIdentifier: TopImageButtonLabelCell.reuseID)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpConstraints()
        configureViewModel()
    }
    
    func configureUI() {
        title = "People"
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureViewModel() {
//        viewModel.getPeopleList()
//        viewModel.error = {errorMessage in
//            print("Error:\(errorMessage)")
//        }
//        viewModel.success =  {
//            self.collectionView.reloadData()
//            self.refreshControl.endRefreshing()
//        }
    }
    @objc func pullToRefresh() {
//        viewModel.items.removeAll()
//        viewModel.getPeopleList()
    }
    
    func setUpConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)])
    }
}



extension SeeAllPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageButtonLabelCell.reuseID, for: indexPath) as! TopImageButtonLabelCell
//        cell.configure(item: viewModel.items[indexPath.item])
        return cell
    }
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 296)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        viewModel.pagination(index: indexPath.item)
    }
}
