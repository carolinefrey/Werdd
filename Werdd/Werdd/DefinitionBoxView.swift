//
//  DefinitionBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/11/22.
//

import UIKit

class DefinitionBoxView: UIView {
    
    let words = Words()
    var blueBox = UIView()
    var word = UILabel()
    var partOfSpeech = UILabel()
    var definition = UILabel()
    var wordAndPartOfSpeechStack = UIStackView()
    var fullDefinitionStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(blueBox)
        addSubview(fullDefinitionStack)
        
        configureBlueBox()
        configureWord()
        configurePartOfSpeech()
        configureDefinition()
        configureWordAndPartOfSpeechStack()
        configureFullDefinitionStack()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureBlueBox() {
        blueBox.backgroundColor = UIColor(named: "Color1")
        blueBox.clipsToBounds = true
        blueBox.layer.cornerRadius = 30
    }
    
    func configureWord() {
        word.font = UIFont(name: "Rubik-Bold", size: 24)
        word.text = words.wordArray[0].word
        word.adjustsFontSizeToFitWidth = true
    }
    
    func configurePartOfSpeech() {
        partOfSpeech.font = UIFont(name: "Rubik-Italic", size: 12)
        partOfSpeech.text = words.wordArray[0].partOfSpeech
    }
    
    func configureDefinition() {
        definition.font = UIFont(name: "Rubik-Light", size: 16)
        definition.text = words.wordArray[0].definition
        definition.lineBreakMode = .byWordWrapping
        definition.numberOfLines = 0
    }
    
    func configureWordAndPartOfSpeechStack() {
        wordAndPartOfSpeechStack.axis = .horizontal
        wordAndPartOfSpeechStack.alignment = .lastBaseline
        wordAndPartOfSpeechStack.distribution = .fillProportionally
        wordAndPartOfSpeechStack.spacing = 10
    }
    
    func configureFullDefinitionStack() {
        fullDefinitionStack.axis = .vertical
        fullDefinitionStack.alignment = .leading
        fullDefinitionStack.distribution = .fillProportionally
        fullDefinitionStack.spacing = 10
    }
    
    func setConstraints() {
        blueBox.translatesAutoresizingMaskIntoConstraints = false
        word.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        definition.translatesAutoresizingMaskIntoConstraints = false
        wordAndPartOfSpeechStack.translatesAutoresizingMaskIntoConstraints = false
        fullDefinitionStack.translatesAutoresizingMaskIntoConstraints = false
        
        wordAndPartOfSpeechStack.addArrangedSubview(word)
        wordAndPartOfSpeechStack.addArrangedSubview(partOfSpeech)
        
        fullDefinitionStack.addArrangedSubview(wordAndPartOfSpeechStack)
        fullDefinitionStack.addArrangedSubview(definition)
        
        NSLayoutConstraint.activate([
            blueBox.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            blueBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            blueBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            blueBox.heightAnchor.constraint(equalTo: heightAnchor),
                        
            fullDefinitionStack.topAnchor.constraint(equalTo: blueBox.topAnchor, constant: 20),
            fullDefinitionStack.leadingAnchor.constraint(equalTo: blueBox.leadingAnchor, constant: 20),
            fullDefinitionStack.trailingAnchor.constraint(equalTo: blueBox.trailingAnchor, constant: -20),
        ])
    }
}
