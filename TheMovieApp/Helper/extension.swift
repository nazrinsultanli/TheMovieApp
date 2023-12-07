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
