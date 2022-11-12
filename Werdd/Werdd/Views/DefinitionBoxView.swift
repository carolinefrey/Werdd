//
//  DefinitionBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/11/22.
//

import UIKit

class DefinitionBoxView: UIView {
    
    //MARK: - UI Properties
    
    let starterWord = Word(word: "Programming", partOfSpeech: "noun", definition: "creating a sequence of instructions to enable the computer to do something")
    
    var blueBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color1")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        return box
    }()
    
    var word: UILabel = {
        let word = UILabel()
        word.translatesAutoresizingMaskIntoConstraints = false
        word.font = UIFont(name: "Rubik-Bold", size: 24)
        word.adjustsFontSizeToFitWidth = true
        return word
    }()
    
    var partOfSpeech: UILabel = {
        let partOfSpeech = UILabel()
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.font = UIFont(name: "Rubik-Italic", size: 12)
        return partOfSpeech
    }()
    
    var definition: UILabel = {
        let definition = UILabel()
        definition.translatesAutoresizingMaskIntoConstraints = false
        definition.font = UIFont(name: "Rubik-Light", size: 16)
        definition.lineBreakMode = .byWordWrapping
        definition.numberOfLines = 0
        return definition
    }()
    
    var wordAndPartOfSpeechStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .lastBaseline
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()
    
    var fullDefinitionStack: UIStackView = {
        let definitionStack = UIStackView()
        definitionStack.translatesAutoresizingMaskIntoConstraints = false
        definitionStack.axis = .vertical
        definitionStack.alignment = .leading
        definitionStack.distribution = .fillProportionally
        definitionStack.spacing = 10
        return definitionStack
    }()
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        word.text = starterWord.word
        partOfSpeech.text = starterWord.partOfSpeech
        definition.text = starterWord.definition

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UI Setup
    
    private func setup() {
        
        addSubview(blueBox)
        addSubview(fullDefinitionStack)
        
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
