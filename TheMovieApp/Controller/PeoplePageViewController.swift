//
//  PeoplePageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import UIKit

class PeoplePageViewController: UIViewController {
    var viewModel = PeoplePageViewModel()
    
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
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: nil, action: nil)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"), style: .done, target: nil, action: nil)
    }
    
    func configureViewModel() {
        viewModel.getPeopleList()
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



extension PeoplePageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageButtonLabelCell.reuseID, for: indexPath) as! TopImageButtonLabelCell

        cell.configure(item: viewModel.items[indexPath.item])
        return cell
    }
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 296)
    }
    
  
    @objc func seeAllButtonTapped(_ sender: UIButton) {
        // Handle "See All" button tap based on the section
        let section = sender.tag
        print("See All button tapped for section \(section)")
        // You can perform the necessary action, e.g., navigate to a new view controller
    }
    
   
}
