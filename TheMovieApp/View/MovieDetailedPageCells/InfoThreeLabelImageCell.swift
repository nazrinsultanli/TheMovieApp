//
//  InfoThreeLabelImageCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 14.12.23.
//

import UIKit

class InfoThreeLabelImageCell: UICollectionViewCell {
    static let reuseID = "InfoThreeLabelImageCell"
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setUpConstraints()
        contentView.backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(info: InfoThreeModel) {
        durationLabel.text = info.releaseData
        languageLabel.text = info.language
        ratingLabel.text = "\(String(describing: info.imdbRating))/10"
        durationImage.image = UIImage(systemName: "clock")
        languageImage.image = UIImage(systemName: "globe")
        ratingImage.image = UIImage(systemName: "star")
    }
    
    
    func setUpConstraints() {

        let stackLanguage = UIStackView()
        let stack1 = UIStackView()
        stackLanguage.addArrangedSubview(languageLabel)
        stackLanguage.addArrangedSubview(languageImage)
        stackLanguage.addArrangedSubview(stack1)
        stackLanguage.axis = .horizontal
        stackLanguage.translatesAutoresizingMaskIntoConstraints = false

        
        let stackDuration = UIStackView()
        let stack2 = UIStackView()
        stackDuration.addArrangedSubview(durationLabel)
        stackDuration.addArrangedSubview(durationImage)
        stackDuration.addArrangedSubview(stack2)
        stackDuration.axis = .horizontal
        stackDuration.translatesAutoresizingMaskIntoConstraints = false
        
        let stackRating = UIStackView()
        let stack3 = UIStackView()
        stackRating.addArrangedSubview(ratingLabel)
        stackRating.addArrangedSubview(ratingImage)
        stackRating.addArrangedSubview(stack3)
        stackRating.axis = .horizontal
        stackRating.translatesAutoresizingMaskIntoConstraints = false
        
        let stackLanDurRa = UIStackView()
        stackLanDurRa.addArrangedSubview(stackLanguage)
        stackLanDurRa.addArrangedSubview(stackDuration)
        stackLanDurRa.addArrangedSubview(stackRating)
        stackLanDurRa.spacing = 10
        stackLanDurRa.axis = .horizontal
        stackLanDurRa.distribution = .fillProportionally
        stackLanDurRa.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackLanDurRa)
        
     
        NSLayoutConstraint.activate([
            stackLanDurRa.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackLanDurRa.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackLanDurRa.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackLanDurRa.heightAnchor.constraint(equalToConstant: 30),
            languageImage.heightAnchor.constraint(equalToConstant: 30),
            languageImage.widthAnchor.constraint(equalToConstant: 30),
            durationImage.heightAnchor.constraint(equalToConstant: 30),
            durationImage.widthAnchor.constraint(equalToConstant: 30),
            ratingImage.heightAnchor.constraint(equalToConstant: 30),
            ratingImage.widthAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
