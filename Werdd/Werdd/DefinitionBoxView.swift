//
//  DefinitionBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/11/22.
//

import UIKit

class DefinitionBoxView: UIView {
    
    let blueBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color1")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        
        return box
    }()
    
    let word: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        label.text = wordArray[0].word
        
        return label
    }()
    
    let partOfSpeech: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Italic", size: 12)
        label.text = wordArray[0].partOfSpeech
        
        return label
    }()
    
    let definition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light", size: 16)
        label.text = wordArray[0].definition
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let wordAndPartofSpeechStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .lastBaseline
        stack.distribution = .fill
        stack.spacing = 10
        
        return stack
    }()
    
    let fullDefinitionStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 10
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(blueBox)
        addSubview(fullDefinitionStack)
        
        wordAndPartofSpeechStack.addArrangedSubview(word)
        wordAndPartofSpeechStack.addArrangedSubview(partOfSpeech)
        
        fullDefinitionStack.addArrangedSubview(wordAndPartofSpeechStack)
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
