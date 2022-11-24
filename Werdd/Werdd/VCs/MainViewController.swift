//
//  ViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/4/22.
//

import UIKit
import Foundation
import Alamofire

class MainViewController: UIViewController {
    
    //MARK: - UI Properties
    
    var randomWord = RandomWord(word: "", results: [])
    
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
    
    lazy var favoriteRandomWordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
        let buttonSymbol = UIImage(systemName: "heart", withConfiguration: largeConfig)
        button.setImage(buttonSymbol, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(favoriteRandomWord), for: .touchUpInside)
        return button
    }()
    
    let tableContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    lazy var favoritesButton: UIBarButtonItem = {
        let config = UIImage.SymbolConfiguration(textStyle: .title1)
        let icon = UIImage(systemName: "heart.text.square.fill", withConfiguration: config)
        let button = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(favButtonTapped))
        button.tintColor = UIColor(named: "favoritesColor")
        return button
    }()
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: werddTitle)
        navigationItem.rightBarButtonItem = favoritesButton
        
        setup()
        
        let tableViewController = TableViewController()
        addChild(tableViewController)
        tableContainerView.addSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
        tableViewController.view.frame = tableContainerView.frame
    }

    //MARK: - UI Setup
    
    private func setup() {
        view.addSubview(definitionBoxView)
        view.addSubview(newWordButton)
        view.addSubview(favoriteRandomWordButton)
        view.addSubview(tableContainerView)
        
        NSLayoutConstraint.activate([
            
            newWordButton.trailingAnchor.constraint(equalTo: definitionBoxView.trailingAnchor, constant: -40),
            newWordButton.bottomAnchor.constraint(equalTo: definitionBoxView.bottomAnchor),
            
            favoriteRandomWordButton.trailingAnchor.constraint(equalTo: newWordButton.leadingAnchor, constant: -5),
            favoriteRandomWordButton.bottomAnchor.constraint(equalTo: definitionBoxView.bottomAnchor),
            
            definitionBoxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            definitionBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            definitionBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            definitionBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            tableContainerView.topAnchor.constraint(equalTo: definitionBoxView.bottomAnchor, constant: 40),
            tableContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //MARK: - Functions
    
    @objc func newWordButtonPressed() {
        fetchRandomWord { word, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                if let word = word {
                    self.updateDefinitionBox(withword: word)
                    self.randomWord = word
                    self.spinner.stopAnimating()
                } else {
                    print("Word not found")
                }
            }
        }
    }
    
    @objc func favoriteRandomWord() {
        DataManager.addFavoriteWord(word: randomWord.word, definition: randomWord.results?[0].definition, partOfSpeech: randomWord.results?[0].partOfSpeech)
    }
    
    @objc func favButtonTapped() {
        let favoritesVC = FavoritesViewController()
        navigationController?.pushViewController(favoritesVC, animated: true)
    }
    
    private func updateDefinitionBox(withword randomWord: RandomWord?) {
        definitionBoxView.word.text = randomWord?.word
        let partOfSpeech = randomWord?.results?[0].partOfSpeech
        definitionBoxView.partOfSpeech.text = "\(partOfSpeech ?? "Not found")"
        let definition = randomWord?.results?[0].definition
        definitionBoxView.definition.text = "\(definition ?? "Definition not found")"
    }
    
    func fetchRandomWord(completion: @escaping (RandomWord?, Error?) -> Void) {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key" : APIConstants.key,
        ]
        
        AF.request("https://wordsapiv1.p.rapidapi.com/words/?random=true", method: .get, headers: headers).responseDecodable(of: RandomWord.self) { response in
            
            self.spinner.startAnimating()
            
            if let error = response.error {
                completion(nil, error)
                print(error.localizedDescription)
            }
            
            let randomWord = response.value
            completion(randomWord, nil)
        }
    }
}
