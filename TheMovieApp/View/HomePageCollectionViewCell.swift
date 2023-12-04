//
//  HomePageCollectionViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 04.12.23.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    static let reuseID = "HomePageCollectionViewCell"
    
    private let titleLabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    
    
    private let myImage: UIImageView = {
        let image = UIImageView()
       
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private func setUpCell() {
            let stack = UIStackView()
            stack.addArrangedSubview(myImage)
            stack.addArrangedSubview(titleLabel)
            stack.axis = .vertical
            stack.spacing = 4
            stack.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(stack)

            NSLayoutConstraint.activate([
                stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

//                myImage.widthAnchor.constraint(equalToConstant: 110),
//                myImage.heightAnchor.constraint(equalToConstant: 200),
            ])
        }

    
    func configure(item: Result) {
        titleLabel.text = item.title
        
        
        if let thumbnailUrl = URL(string: "https://image.tmdb.org/t/p/original/"+item.backdropPath!) {
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

