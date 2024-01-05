//
//  DataBaseAdapter.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 05.01.24.
//

import Foundation
import KeychainSwift
class DataBaseAdapter {
    let keychain = KeychainSwift()
    
    func saveUserInfo (user: User)
    {
        UserDefaults.standard.setValue(user.lastname, forKey: "lastName")
        keychain.set(user.email, forKey: "email")
    }
}
