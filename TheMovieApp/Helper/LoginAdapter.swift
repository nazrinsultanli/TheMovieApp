//
//  LoginAdapter.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 05.01.24.
//

import Foundation
import UIKit
import GoogleSignIn
enum LoginType {
    case google
    case facebook
    case apple
}
struct User {
    var name: String
    var password: String
    var email: String
    var lastname: String
}
class LoginAdapter {
    var controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    var completion: ((User)->())?
    func login(type: LoginType) {
        switch type {
        case .google:
            googleLogin()
        case .facebook:
            facebookLogin()
        case .apple:
            appleLogin()
        }
    }
    
    fileprivate func googleLogin(){
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error = error {
                
            } else if let result = result {
                let user = User(name: result.user.profile?.name ?? "",
                                password:  "",
                                email: result.user.profile?.email ?? "",
                                lastname: result.user.profile?.familyName ?? "")
                self.completion?(user)
            }
        }
    }
    fileprivate func facebookLogin(){
        
    }
    fileprivate func appleLogin(){
        
    }
}
