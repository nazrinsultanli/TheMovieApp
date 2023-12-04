//
//  HomePageTableViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 03.12.23.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
   
    static let reuseID = "HomePageTableViewCell"
    var movies: [Result]? {
        didSet {
            collectionView.reloadData()
        }
    }
    

    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .green
        collection.register(HomePageCollectionViewCell.self, forCellWithReuseIdentifier: HomePageCollectionViewCell.reuseID)
        return collection
    }()
    
    

    

    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
 
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpCell()
        }
    
    private func setUpCell() {
            contentView.addSubview(collectionView)

            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
}

extension HomePageTableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCollectionViewCell.reuseID, for: indexPath) as! HomePageCollectionViewCell
        if let item = movies?[indexPath.row] {
            cell.configure(item: item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}


/*
 //
 //  HomePageTableViewCell.swift
 //  TheMovieApp
 //
 //  Created by Nazrin Sultanlı on 03.12.23.
 //

 import UIKit

 class HomePageTableViewCell: UITableViewCell {
     
     static let reuseID = "HomePageTableViewCell"
     
     private let titleLabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 10)
         return label
     }()
     
     private let descriptionLabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 14)
         return label
     }()
     
     private let priceLabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.boldSystemFont(ofSize: 14)
         return label
     }()
     
     private let myImage: UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.layer.cornerRadius = 10
         image.layer.masksToBounds = true
         return image
     }()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setUpCell()
     }

     
     required init?(coder: NSCoder) {
         fatalError("Init(coder:) has not been implemented")
     }
     
     
     private func setUpCell() {
         let stack = UIStackView()
         stack.addArrangedSubview(titleLabel)
         stack.addArrangedSubview(descriptionLabel)
         stack.addArrangedSubview(priceLabel)
         stack.axis = .vertical
         stack.spacing = 4
         stack.translatesAutoresizingMaskIntoConstraints = false
         
         contentView.addSubview(stack)
         contentView.addSubview(myImage)
         
         NSLayoutConstraint.activate([
             stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
             stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         
             myImage.widthAnchor.constraint(equalToConstant: 110),
             myImage.heightAnchor.constraint(equalToConstant: 80),
             myImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
             myImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
         ])
     }
     
     func configure(item: Result) {
         titleLabel.text = item.title
         descriptionLabel.text = item.overview
         priceLabel.text = item.originalTitle
         
         
         if let thumbnailUrl = URL(string: "https://image.tmdb.org/t/p/original/"+item.backdropPath!) {
                 // Load image from URL using URLSession
                 URLSession.shared.dataTask(with: thumbnailUrl) { (data, _, error) in
                     if let error = error {
                         print("Error loading image: \(error.localizedDescription)")
                     } else if let data = data {
                         DispatchQueue.main.async {
                             self.myImage.image = UIImage(data: data)
                         }
                     }
                 }.resume()
             }

     }
 }

 */
