//
//  TableViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 11/23/22.
//

import UIKit
import Alamofire

class TableViewController: UIViewController {
    
    //MARK: UI Properties
    
    var words: [Word] = []
    var searchText = ""
    var antonyms = ""
    var exampleUsage: [String] = []
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Find a word..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.autocapitalizationType = .none
        return searchBar
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 30
        tableView.rowHeight = 70
        return tableView
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    //MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    //MARK: - UI Setup

    private func setup() {
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(spinner)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.searchTableViewCellIdentifier)
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            spinner.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 60),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
    
    //MARK: - Functions
    
    func fetchWord(word: String, completion: @escaping ([Word]?, Error?) -> Void) {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key" : APIConstants.key,
        ]
                
        AF.request("https://wordsapiv1.p.rapidapi.com/words/\(word)", method: .get, headers: headers).responseDecodable(of: SearchedWord.self) { response in
            
            self.spinner.startAnimating()

            if let error = response.error {
                print(error.localizedDescription)
            }
            
            if let error = response.error {
                completion(nil, error)
                print(error.localizedDescription)
            }
            
            let response = response.value?.results.map { result in
                Word(word: self.searchText, searchResult: result)
            } ?? []
            
            completion(response, nil)
        }
    }
    
    func fetchAntonyms(word: String) {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key" : APIConstants.key,
        ]
        
        AF.request("https://wordsapiv1.p.rapidapi.com/words/\(word)/antonyms", method: .get, headers: headers).responseDecodable(of: Antonyms.self) { response in
            if let error = response.error {
                print(error.localizedDescription)
            }
            self.antonyms = response.value?.antonyms.joined(separator: ", ") ?? "Antonyms not found"
        }
    }
    
    func fetchExampleUsage(word: String) {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key" : APIConstants.key,
        ]
        
        AF.request("https://wordsapiv1.p.rapidapi.com/words/\(word)/examples", method: .get, headers: headers).responseDecodable(of: ExampleUsage.self) { response in
            if let error = response.error {
                print(error.localizedDescription)
            }
            self.exampleUsage = response.value?.examples ?? ["Example usage not found"]
        }
    }
}

//MARK: UITableViewDataSource Methods

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count //number of rows in table
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.searchTableViewCellIdentifier) as! SearchTableViewCell
        let currentWord = words[indexPath.row]
        cell.setFetchedResults(word: currentWord)
        
        return cell
    }
}

//MARK: UITableViewDelegate Methods

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(word: words[indexPath.row], antonyms: antonyms, exampleUsage: exampleUsage, showAddtoFavorites: true)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - UISearchBarDelegate Methods

extension TableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchText = searchBar.text ?? ""
        
        fetchWord(word: searchText) { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                if let result = result {
                    self.words = result
                    self.tableView.reloadData()
                    self.spinner.stopAnimating()
                } else {
                    let message = UIAlertController(title: "Oops!", message: "Word not found.", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Try again", style: .default)
                    message.addAction(ok)
                    self.present(message, animated: true, completion: nil)
                }
            }
        }
        fetchAntonyms(word: searchText)
        fetchExampleUsage(word: searchText)
    }
}
