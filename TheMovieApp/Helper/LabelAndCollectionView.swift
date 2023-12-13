//
//  LabelAndCollectionView.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 13.12.23.
//

import UIKit
import Foundation

class LabelAndCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var data: [String] = [] {
        didSet {
            if !data.isEmpty {
                collectionView.reloadData()
            }
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(HorizontalLabelsCollectionCell.self, forCellWithReuseIdentifier: HorizontalLabelsCollectionCell.reuseID)
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
//        label.text = labelText
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(label)
//        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(text: String) {
        label.text = text
    }    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalLabelsCollectionCell.reuseID, for: indexPath) as! HorizontalLabelsCollectionCell
                // Configure the cell with data
        cell.configure(genre: data[indexPath.item])
        return cell
    }
}

