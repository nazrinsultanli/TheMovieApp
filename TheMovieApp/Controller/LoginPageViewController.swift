//
//  LoginPageViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 05.01.24.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("sign in with Google", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(googleButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("sign in with Facebook", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(facebookButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("sign in with Apple", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(appleButtonClicked), for: .touchUpInside)
        return button
    }()

    var adapter: LoginAdapter?
    var dataBaseAdapter = DataBaseAdapter()
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = LoginAdapter(controller: self)
        adapter?.completion = { user in
            self.dataBaseAdapter.saveUserInfo(user: user)
        }
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(appleButton)
        
        NSLayoutConstraint.activate([
            appleButton.heightAnchor.constraint(equalToConstant: 50),
            appleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            appleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            appleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.bottomAnchor.constraint(equalTo: appleButton.topAnchor, constant: -20),
            facebookButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            facebookButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.bottomAnchor.constraint(equalTo: facebookButton.topAnchor, constant: -20),
            googleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            googleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
        ])
        
    }

    @objc func googleButtonClicked(sender: UIButton!) {
        adapter?.login(type: .google)
    }
    
    @objc func facebookButtonClicked(sender: UIButton!) {
      print("Button tapped")
    }
    
    @objc func appleButtonClicked(sender: UIButton!) {
        print("Button tapped")
      }
    
}
