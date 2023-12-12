//
//  SearchViewTableViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 09.12.23.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {
    static let reuseID = "SearchViewTableViewCell"
    let genreArray = GenresHelper.shared.genres
    var genres = [String]()
    
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
    private lazy var starImage: UIImageView = {
        let imageViewm = UIImageView()
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        imageViewm.contentMode = .scaleAspectFill
       // imageViewm.layer.masksToBounds = true
        imageViewm.tintColor = .yellow
       // imageViewm.frame = CGRect(x: 0, y: 0, width: 20, height:20)
        return imageViewm
    }()
    
    private lazy var ratingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .gray
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var genresCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(HorizontalLabelsCollectionCell.self, forCellWithReuseIdentifier: HorizontalLabelsCollectionCell.reuseID)
        return collection
    }()
    

  //------------------------------
    required init?(coder: NSCoder) {
           fatalError("Init(coder:) has not been implemented")
       }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setUpConstraints()
    }
    
    func configure(item: MovieResult) {
        titleLabel.text = item.originalTitle
        movieImage.loadImage(url: item.posterPath ?? "")
        descriptionLabel.text = item.overview
        starImage.image =  UIImage(systemName: "star.fill")
        if let rating = item.voteAverage {
            ratingTextLabel.text = "\(String(describing: rating)) / 10 IMDB"
        }
        if let genreIDs = item.genreIDS {
                for genreIndex in genreIDs {
                    if genreIndex >= 0, genreIndex < genreArray.count {
                        genres.append(genreArray[genreIndex].name ?? "" )
                    }
                }
            }
    }

    func setUpConstraints() {
        addSubview(movieImage)
        contentView.backgroundColor = .white
        
        let ratingView = UIStackView()
        ratingView.addArrangedSubview(starImage)
        ratingView.addArrangedSubview(ratingTextLabel)
        ratingView.axis = .horizontal
        ratingView.spacing = 10
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(ratingView)
        stack.addArrangedSubview(genresCollectionView)
        stack.addArrangedSubview(descriptionLabel)
        stack.axis = .vertical // Set the stack view's axis to vertical
        stack.backgroundColor = .purple
       // stack.spacing = 4
        stack.distribution = .fillEqually
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            movieImage.widthAnchor.constraint(equalToConstant: 140),
            
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            starImage.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor, constant: 10),
            starImage.topAnchor.constraint(equalTo: ratingView.topAnchor, constant: 10),
            starImage.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
            //            starImage.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor) ,
            starImage.widthAnchor.constraint(equalToConstant: 20),
//            starImage.heightAnchor.constraint(equalToConstant: 10)
            ratingTextLabel.trailingAnchor.constraint(equalTo: starImage.leadingAnchor, constant: 10)
        ])
     
    }
}


extension SearchViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = genresCollectionView.dequeueReusableCell(withReuseIdentifier: HorizontalLabelsCollectionCell.reuseID, for: indexPath) as! HorizontalLabelsCollectionCell
        cell.configure(genre: genres[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 80, height: 24)
    }
}
