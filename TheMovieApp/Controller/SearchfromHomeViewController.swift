//
//  SearchfromHomeViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 09.12.23.
//

import UIKit

class SearchfromHomeViewController: UIViewController {

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "search for"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.setLeftView(image: UIImage(systemName: "magnifyingglass")!)
        textField.borderStyle = .none
        return textField
    }()
    
    private lazy var searchView: UIView = {
        let searcViewm = UIView()
        searcViewm.translatesAutoresizingMaskIntoConstraints = false
        searcViewm.backgroundColor = . white
        searcViewm.layer.cornerRadius = 25
        searcViewm.layer.borderWidth = 1
        return searcViewm
    }()
    
    private lazy var tableView: UITableView = {
            let table = UITableView()
            table.separatorColor = .clear
            table.showsVerticalScrollIndicator = false
            table.translatesAutoresizingMaskIntoConstraints = false
            table.delegate = self
            table.dataSource = self
            table.backgroundColor = .white
            table.register(SearchViewTableViewCell.self, forCellReuseIdentifier: SearchViewTableViewCell.reuseID)
        table.backgroundColor = .gray
            return table
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        view.backgroundColor = .white
        view.addSubview(searchView)
        searchView.addSubview(searchTextField)
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            
            searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 0),
            searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 0),
            searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10),
            searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            
        ]
        )
    }
}


extension SearchfromHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewTableViewCell.reuseID, for: indexPath) as! SearchViewTableViewCell
        return cell
    }
    
    
}
