//
//  DetailViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/19/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedWord = Word(word: "", partOfSpeech: "", definition: "", synonyms: "", antonyms: "")
    
    let wordTitle = UILabel()
    
    var definitionBox: DefinitionBoxDetailView
    
    var synonymsBox: SynonymsBoxView
    
    var antonymsBox: AntonymsBoxView
    
    let exampleUsage = ExampleUsageBoxView()
    
    init(selectedWord: Word) {
        self.selectedWord.word = selectedWord.word
        self.selectedWord.partOfSpeech = selectedWord.partOfSpeech
        self.selectedWord.definition = selectedWord.definition
        
        definitionBox = DefinitionBoxDetailView(word: selectedWord)
        synonymsBox = SynonymsBoxView(word: selectedWord)
        antonymsBox = AntonymsBoxView(word: selectedWord)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        
        view.addSubview(wordTitle)
        view.addSubview(definitionBox)
        view.addSubview(synonymsBox)
        view.addSubview(antonymsBox)
        view.addSubview(exampleUsage)
        
        configureWordTitle()
        
        setConstraints()
    }
    
    private func configureWordTitle() {
        wordTitle.text = selectedWord.word
        wordTitle.textColor = .black
        wordTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        wordTitle.textAlignment = .left
        wordTitle.lineBreakMode = .byWordWrapping
        wordTitle.numberOfLines = 0
        wordTitle.adjustsFontSizeToFitWidth = true
    }
    
    private func setConstraints() {
        wordTitle.translatesAutoresizingMaskIntoConstraints = false
        definitionBox.translatesAutoresizingMaskIntoConstraints = false
        synonymsBox.translatesAutoresizingMaskIntoConstraints = false
        antonymsBox.translatesAutoresizingMaskIntoConstraints = false
        exampleUsage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wordTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            wordTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            definitionBox.topAnchor.constraint(equalTo: wordTitle.bottomAnchor, constant: 20),
            definitionBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            definitionBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            synonymsBox.topAnchor.constraint(equalTo: definitionBox.bottomAnchor, constant: 180),
            synonymsBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            synonymsBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            antonymsBox.topAnchor.constraint(equalTo: synonymsBox.bottomAnchor, constant: 130),
            antonymsBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            antonymsBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            exampleUsage.topAnchor.constraint(equalTo: antonymsBox.bottomAnchor, constant: 130),
            exampleUsage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exampleUsage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }
}
