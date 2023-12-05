//
//  HomePageCollectionViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 04.12.23.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    static let reuseID = "HomePageCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        
        label.numberOfLines = 0 // Allow multiple lines for the label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            imageView.heightAnchor.constraint(equalToConstant: 240),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 24) // Ensure the label has a minimum height
        ])
    }
    
    func configure(item: Result) {
        titleLabel.text = item.title
        
        if let backdropPath = item.backdropPath,
           let thumbnailUrl = URL(string: "https://image.tmdb.org/t/p/original/" + backdropPath) {
            URLSession.shared.dataTask(with: thumbnailUrl) { (data, _, error) in
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                } else if let data = data {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
