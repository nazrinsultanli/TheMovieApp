//
//  HomePageTableViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 03.12.23.
//

import UIKit
//1
protocol HomePageCollectionViewCellDelegate: AnyObject {
    func didSelectMovie(_ movie: Int)
    func didSelectSeeAll(endpoint: MovieEndpoint)
}



class HomePageCollectionViewCell: UICollectionViewCell {
    //2
    weak var delegate: HomePageCollectionViewCellDelegate?
    
    static let reuseID = "HomePageCollectionViewCell"
    var movies = [MovieResult]()
    var endPoint: MovieEndpoint?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("see all>", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        
        
        collection.register(TopImageButtonLabelCell.self, forCellWithReuseIdentifier: TopImageButtonLabelCell.reuseID)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
        seeAllButton.addTarget(self, action: #selector(seeAllButtonClicked), for: .touchUpInside)
    }
    
    @objc func seeAllButtonClicked(_ sender: UIButton?) {
        delegate?.didSelectSeeAll(endpoint: endPoint ?? .popular)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    func configure(title: String, movies: [MovieResult], endpoint: MovieEndpoint) {
        titleLabel.text = title
        self.movies = movies
        self.endPoint = endpoint
        collectionView.reloadData()
    }
    private func setUpCell() {
        let stack = UIStackView()
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(seeAllButton)
        stack.axis = .horizontal
       // stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            seeAllButton.trailingAnchor.constraint(equalTo: stack.trailingAnchor),

            collectionView.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
    }
    
   
}

extension HomePageCollectionViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageButtonLabelCell.reuseID, for: indexPath) as! TopImageButtonLabelCell
        cell.configure(item: movies[indexPath.row] )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: 170, height: 280)
        .init(width: 167, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //3
        if let selectedMovie = movies[indexPath.row].id {
            delegate?.didSelectMovie(selectedMovie)
        }
        }
}
