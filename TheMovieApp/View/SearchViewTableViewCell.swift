//
//  SearchViewTableViewCell.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 09.12.23.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {
    static let reuseID = "SearchViewTableViewCell"
    
    private lazy var imageViewm: UIView = {
        let imageViewm = UIView()
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        imageViewm.backgroundColor = . white
        imageViewm.layer.cornerRadius = 25
        imageViewm.layer.borderWidth = 1
        return imageViewm
    }()
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
