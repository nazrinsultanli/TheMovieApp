//
//  HorizontalLabelsCollectionCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 11.12.23.
//

import UIKit

class HorizontalLabelsCollectionCell: UICollectionViewCell {
    static let reuseID = "HorizontalLabelsCollectionCell"
    
    
    private lazy var titleLabelView: UIView = {
         let imageViewm = UIView()
         imageViewm.translatesAutoresizingMaskIntoConstraints = false
         imageViewm.backgroundColor = . red
         imageViewm.layer.cornerRadius = 10
         imageViewm.layer.borderWidth = 1
         return imageViewm
     }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 15
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    func  setUpCell() {
        titleLabelView.addSubview(titleLabel)
        addSubview(titleLabelView)
        
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: topAnchor),
            titleLabelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleLabelView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor)
        ])
    }
    func configure(genre: String) {
        titleLabel.text = genre
    }
    
}
