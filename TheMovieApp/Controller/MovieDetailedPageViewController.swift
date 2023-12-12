//
//  MovieDetailedPageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 12.12.23.
//

import UIKit

class MovieDetailedPageViewController: UIViewController {
    var selectedMovie: MovieResult?
    
    private lazy var movieImage: UIImageView = {
        let imageViewm = UIImageView()
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        imageViewm.layer.cornerRadius = 25
        imageViewm.contentMode = .scaleAspectFill
        imageViewm.layer.masksToBounds = true
        return imageViewm
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .cyan
        return label
    }()
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var languageImage: UIImageView = {
        let imageViewm = UIImageView()
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        imageViewm.layer.cornerRadius = 10
        imageViewm.contentMode = .scaleAspectFill
        imageViewm.layer.masksToBounds = true
        return imageViewm
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var durationImage: UIImageView = {
        let imageViewm = UIImageView()
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        imageViewm.layer.cornerRadius = 10
        imageViewm.contentMode = .scaleAspectFill
        imageViewm.layer.masksToBounds = true
        return imageViewm
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var ratingImage: UIImageView = {
        let imageViewm = UIImageView()
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        imageViewm.layer.cornerRadius = 10
        imageViewm.contentMode = .scaleAspectFill
        imageViewm.layer.masksToBounds = true
        return imageViewm
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
//    private lazy var scrollView: UIScrollView = {
//        
//    }
//    private lazy var genresCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.showsHorizontalScrollIndicator = false
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.dataSource = self
//        collection.delegate = self
//        collection.register(HorizontalLabelsCollectionCell.self, forCellWithReuseIdentifier: HorizontalLabelsCollectionCell.reuseID)
//        return collection
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createSegmentedControl()
        setUpConstraints()

    }
    func createSegmentedControl() {
        let items = ["Details", "Trails","Cast","Shots"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .blue
        view.addSubview(segmentedControl)
    }
    
    @objc func suitDidChange(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("a")
        case 1:
            print("b")
        case 2:
            print("c")
        case 3:
            print("d")
        default:
            print("f")
        }
    }
    func setUpConstraints() {
        view.addSubview(movieImage)
        view.addSubview(titleLabel)
        
        
        let stackLanguage = UIStackView()
        stackLanguage.addArrangedSubview(languageLabel)
        stackLanguage.addArrangedSubview(languageImage)
        
        let stackDuration = UIStackView()
        stackDuration.addArrangedSubview(durationLabel)
        stackDuration.addArrangedSubview(durationImage)
        
        let stackRating = UIStackView()
        stackDuration.addArrangedSubview(ratingLabel)
        stackRating.addArrangedSubview(ratingImage)
        
        let stackLanDurRa = UIStackView()
        stackLanDurRa.addArrangedSubview(stackLanguage)
        stackLanDurRa.addArrangedSubview(stackDuration)
        stackLanDurRa.addArrangedSubview(stackRating)
        stackLanDurRa.spacing = 6
        stackLanDurRa.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieImage.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieImage.heightAnchor.constraint(equalToConstant: 30),
            
            stackLanDurRa.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackLanDurRa.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackLanDurRa.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackLanDurRa.heightAnchor.constraint(equalToConstant: 30),
            
            stackLanDurRa.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackLanDurRa.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackLanDurRa.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackLanDurRa.heightAnchor.constraint(equalToConstant: 30)
            
            
        
        ])
    }
    
}
