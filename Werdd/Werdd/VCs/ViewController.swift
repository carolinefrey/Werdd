//
//  ViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/4/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //MARK: - UI Properties
    
    //let words = Words()
    var words: [Word] = []
    var searchText = ""
    var antonyms = ""
    var exampleUsage = ""
    
    let werddTitle: UILabel = {
        let werddTitle = UILabel()
        werddTitle.translatesAutoresizingMaskIntoConstraints = false
        werddTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        werddTitle.text = "Werdd."
        werddTitle.textAlignment = .left
        werddTitle.adjustsFontSizeToFitWidth = true
        return werddTitle
    }()
    
    let definitionBoxView: DefinitionBoxView = {
        let boxView = DefinitionBoxView()
        boxView.translatesAutoresizingMaskIntoConstraints = false
        return boxView
    }()
    
    lazy var newWordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
        let buttonSymbol = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: largeConfig)
        button.setImage(buttonSymbol, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(newWordButtonPressed), for: .touchUpInside)
        return button
    }()
    
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
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
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
        view.addSubview(werddTitle)
        view.addSubview(definitionBoxView)
        view.addSubview(newWordButton)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
        NSLayoutConstraint.activate([
            werddTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            werddTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            newWordButton.trailingAnchor.constraint(equalTo: definitionBoxView.trailingAnchor, constant: -40),
            newWordButton.bottomAnchor.constraint(equalTo: definitionBoxView.bottomAnchor),
            
            definitionBoxView.topAnchor.constraint(equalTo: werddTitle.bottomAnchor),
            definitionBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            definitionBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            definitionBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            tableView.topAnchor.constraint(equalTo: definitionBoxView.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Functions
    
    @objc func newWordButtonPressed() {
        guard let wordsURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true") else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: wordsURL)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(APIConstants.key, forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let randomWord = try JSONDecoder().decode(RandomWord.self, from: data)
                DispatchQueue.main.async {
                    self.updateDefinitionBox(withword: randomWord)
                }
            } catch {
                print("Failed to convert \(error.localizedDescription)")
            }
        }.resume()
    }
    
    private func updateDefinitionBox(withword randomWord: RandomWord?) {
        definitionBoxView.word.text = randomWord?.word
        
        let partOfSpeech = randomWord?.results[0].partOfSpeech
        definitionBoxView.partOfSpeech.text = "\(partOfSpeech ?? "Not found")"
        
        let definition = randomWord?.results[0].definition
        definitionBoxView.definition.text = "\(definition ?? "Definition not found")"
    }
    
    func fetchWord(word: String) {
        guard let wordsURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)") else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: wordsURL)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(APIConstants.key, forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(SearchedWord.self, from: data)
                
                self.words = result.results.map { result in
                    Word(word: self.searchText, searchResult: result)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("Failed to convert \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchAntonyms(word: String) {
        guard let wordsURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)/antonyms") else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: wordsURL)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(APIConstants.key, forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(Antonyms.self, from: data)
                
                self.antonyms = result.antonyms.joined(separator: ", ")
                
            } catch {
                print("Failed to convert \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchExampleUsage(word: String) {
        guard let wordsURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)/examples") else {
            print("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: wordsURL)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(APIConstants.key, forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ExampleUsage.self, from: data)
                
                self.exampleUsage = result.examples.joined(separator: ", ")
                
            } catch {
                print("Failed to convert \(error.localizedDescription)")
            }
        }.resume()
    }
}

//MARK: UITableViewDataSource Methods

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count //number of rows in table
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let currentWord = words[indexPath.row]
        cell.setFetchedResults(word: currentWord)
        
        return cell
    }
}

//MARK: UITableViewDelegate Methods

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(word: words[indexPath.row], antonyms: antonyms, exampleUsage: exampleUsage)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - UISearchBarDelegate Methods

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text ?? ""
        fetchWord(word: searchText)
        fetchAntonyms(word: searchText)
        fetchExampleUsage(word: searchText)
    }
}

