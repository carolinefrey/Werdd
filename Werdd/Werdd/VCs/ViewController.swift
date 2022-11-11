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
    
    let words = Words()

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
    
//    private func randomizedWord() -> StaticWord? {
//        return words.wordArray.randomElement()
//    }
    
    private func updateDefinitionBox(withword randomWord: RandomWord?) {
        definitionBoxView.word.text = randomWord?.word
        
        let partOfSpeech = randomWord?.results[0].partOfSpeech
        definitionBoxView.partOfSpeech.text = "\(partOfSpeech ?? "Not found")"
        
        let definition = randomWord?.results[0].definition
        definitionBoxView.definition.text = "\(definition ?? "Definition not found")"
    }
}

//MARK: UITableViewDataSource Methods

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.wordArray.count //number of rows in table
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell //gives us access to methods
        let currentWord = words.wordArray[indexPath.row]
        cell.set(word: currentWord)
        return cell
    }
}

//MARK: UITableViewDelegate Methods

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(selectedWord: words.wordArray[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
