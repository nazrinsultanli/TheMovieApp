//
//  SearchfromHomeViewController.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 09.12.23.
//

import UIKit
import UIKit

class SearchFromHomeViewController: UIViewController {

    var viewModel = SearchPageViewModel()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "search for"
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.setLeftView(image: UIImage(systemName: "magnifyingglass")!)
        textField.borderStyle = .none
        return textField
    }()
    
    private lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 25
        searchView.layer.borderWidth = 1
        return searchView
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorColor = .clear
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(SearchViewTableViewCell.self, forCellReuseIdentifier: SearchViewTableViewCell.reuseID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        setUpUI()
        configureConstraints()
        configureViewModel()
    }

    func setUpUI() {
        title = "Search"
        view.backgroundColor = .white
    
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    fileprivate func configureConstraints() {
        view.addSubview(searchView)
        searchView.addSubview(searchTextField)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            
            searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 0),
            searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 0),
            searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10),
            searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    fileprivate func configureViewModel() {
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success = {
            self.tableView.reloadData()
        }
    }
}

extension SearchFromHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewTableViewCell.reuseID, for: indexPath) as! SearchViewTableViewCell
        cell.configure(item: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MovieDetailedCoordinator(navigationController: navigationController ?? UINavigationController(), movieID: viewModel.items[indexPath.row].id ?? 0)
        controller.start()
    }
}

extension SearchFromHomeViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        let searchText = textField.text ?? ""
        if searchText.isEmpty {
            viewModel.items.removeAll()
            tableView.reloadData()
        } else {
            viewModel.getSearchedMovies(searchText: searchText)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Returning true allows the text change to happen
        return true
    }
}
