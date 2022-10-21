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
    
    let definitionBox = UIView()
    
    let synonymsBox = UIView()
    
    let antonymsBox = UIView()
    
    let exampleBox = UIView()
    
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
        view.addSubview(definitionBox)
        
        configureWordTitle()
        configureDefinitionBox()
        
        setConstraints()
    }
    
    private func configureWordTitle() {
        wordTitle.text = selectedWord.word
        wordTitle.textColor = .black
        wordTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        wordTitle.textAlignment = .left
    }
    
    private func configureDefinitionBox() {
        definitionBox.backgroundColor = UIColor(named: "Color1")
        definitionBox.clipsToBounds = true
        definitionBox.layer.cornerRadius = 30
    }
    
    private func setConstraints() {
        wordTitle.translatesAutoresizingMaskIntoConstraints = false
        definitionBox.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wordTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            definitionBox.topAnchor.constraint(equalTo: wordTitle.bottomAnchor, constant: 20),
            definitionBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            definitionBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            definitionBox.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}
