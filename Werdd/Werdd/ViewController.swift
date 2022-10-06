//
//  ViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    let werddTitle: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont(name: "Rubik-Bold", size: 36)
        text.text = "Werdd."
        text.textAlignment = .left
        
        return text
    }()
    
    let definitionBox: UILabel = {
        let box = UILabel()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color1")
        box.clipsToBounds = true
        box.layer.cornerRadius = 45
        
        return box
    }()
    
    let word: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        label.text = "Programming"
        
        return label
    }()
    
    let partOfSpeech: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Italic", size: 12)
        label.text = "noun"
        
        return label
    }()
    
    let definition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light", size: 16)
        label.text = "creating a sequence of instructions to enable the computer to do something"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let wordAndPartofSpeech: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .bottom
        stack.distribution = .fill
        stack.spacing = 10
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(named: "Color5")
        
        view.addSubview(werddTitle)
        view.addSubview(definitionBox)
        view.addSubview(wordAndPartofSpeech)
        view.addSubview(definition)

        //view.addSubview(word)
        
        wordAndPartofSpeech.addArrangedSubview(word)
        wordAndPartofSpeech.addArrangedSubview(partOfSpeech)
        
        NSLayoutConstraint.activate([
            werddTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            werddTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            definitionBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            definitionBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            definitionBox.topAnchor.constraint(equalTo: werddTitle.bottomAnchor, constant: 20),
            definitionBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            wordAndPartofSpeech.leadingAnchor.constraint(equalTo: definitionBox.leadingAnchor, constant: 20),
            wordAndPartofSpeech.topAnchor.constraint(equalTo: definitionBox.topAnchor, constant: 20),
            //wordAndPartofSpeech.trailingAnchor.constraint(equalTo: definitionBox.trailingAnchor, constant: -20),

//            word.leadingAnchor.constraint(equalTo: definitionBox.leadingAnchor, constant: 20),
//            word.topAnchor.constraint(equalTo: definitionBox.topAnchor, constant: 20),
            
            definition.leadingAnchor.constraint(equalTo: definitionBox.leadingAnchor, constant: 20),
            definition.topAnchor.constraint(equalTo: word.bottomAnchor, constant: 10),
            definition.trailingAnchor.constraint(equalTo: definitionBox.trailingAnchor, constant: -20),
        ])

    }
}

