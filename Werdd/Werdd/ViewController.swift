//
//  ViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    let words = Words()
    let werddTitle = UILabel()
    let definitionBoxView = DefinitionBoxView()
    lazy var newWordButton = UIButton()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        
        view.addSubview(werddTitle)
        view.addSubview(definitionBoxView)
        view.addSubview(newWordButton)
        view.addSubview(tableView)
        
        configureWerddTitle()
        configureNewWordButton()
        configureTableView()
        
        setConstraints()
    }
    
    // MARK: Deselect cell when view controller pops off the stack
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    func configureWerddTitle() {
        werddTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        werddTitle.text = "Werdd."
        werddTitle.textAlignment = .left
    }
    
    func configureNewWordButton() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
        let buttonSymbol = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: largeConfig)
        
        newWordButton.setImage(buttonSymbol, for: .normal)
        newWordButton.tintColor = .white
        newWordButton.addTarget(self, action: #selector(newWordButtonPressed), for: .touchUpInside)
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 30
        tableView.rowHeight = 70
    }

    func setConstraints() {
        werddTitle.translatesAutoresizingMaskIntoConstraints = false
        definitionBoxView.translatesAutoresizingMaskIntoConstraints = false
        newWordButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            werddTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
    
    @objc func newWordButtonPressed() {
        let randomWord = randomizedWord()
        updateDefinitionBox(withword: randomWord)
    }
    
    func randomizedWord() -> Word? {
        return words.wordArray.randomElement()
    }
    
    func updateDefinitionBox(withword wordChoice: Word?) {
        definitionBoxView.word.text = wordChoice?.word
        definitionBoxView.partOfSpeech.text = wordChoice?.partOfSpeech
        definitionBoxView.definition.text = wordChoice?.definition
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
        show(detailVC, sender: self)
    }
}
