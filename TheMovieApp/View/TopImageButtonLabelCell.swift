//
//  HomePageCollectionViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 04.12.23.
//

import UIKit
import Kingfisher
class TopImageButtonLabelCell: UICollectionViewCell {
    static let reuseID = "TopImageButtonLabelCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .brown
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
       
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            //imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            
            
//            imageView.heightAnchor.constraint(equalToConstant: 240),
//            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configure(item: Result) {
        titleLabel.text = item.title
        if let path = item.backdropPath {
            imageView.loadImage(url: path)
        }
        
    }
}
