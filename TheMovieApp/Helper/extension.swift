//
//  extension.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url:String) {
        let path = NetworkHelperLinker.imagePath+url
        if let finalUrl = URL(string: path) {
            self.kf.setImage(with: finalUrl )
        }
    }
}


extension UITextField {
    func setLeftView(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25)) // set your Own size
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}
