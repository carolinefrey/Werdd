//
//  DetailViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/19/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedWord = Word(word: "", partOfSpeech: "", definition: "")
    
    let wordTitle = UILabel()
    
    let definition = DefinitionBoxDetailView()
    
    let synonyms = SynonymsBoxView()
    
    let antonyms = AntonymsBoxView()
    
    let exampleUsage = ExampleUsageBoxView()
    
    init(selectedWord: Word) {
        self.selectedWord.word = selectedWord.word
        self.selectedWord.partOfSpeech = selectedWord.partOfSpeech
        self.selectedWord.definition = selectedWord.definition

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        
        view.addSubview(wordTitle)
        view.addSubview(definition)
        view.addSubview(synonyms)
        view.addSubview(antonyms)
        view.addSubview(exampleUsage)
        
        configureWordTitle()
        
        setConstraints()
    }
    
    private func configureWordTitle() {
        wordTitle.text = selectedWord.word
        wordTitle.textColor = .black
        wordTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        wordTitle.textAlignment = .left
    }
    
    private func setConstraints() {
        wordTitle.translatesAutoresizingMaskIntoConstraints = false
        definition.translatesAutoresizingMaskIntoConstraints = false
        synonyms.translatesAutoresizingMaskIntoConstraints = false
        antonyms.translatesAutoresizingMaskIntoConstraints = false
        exampleUsage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wordTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            definition.topAnchor.constraint(equalTo: wordTitle.bottomAnchor, constant: 20),
            definition.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            definition.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            synonyms.topAnchor.constraint(equalTo: definition.bottomAnchor, constant: 180),
            synonyms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            synonyms.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            antonyms.topAnchor.constraint(equalTo: synonyms.bottomAnchor, constant: 130),
            antonyms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            antonyms.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            exampleUsage.topAnchor.constraint(equalTo: antonyms.bottomAnchor, constant: 130),
            exampleUsage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exampleUsage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }
}
