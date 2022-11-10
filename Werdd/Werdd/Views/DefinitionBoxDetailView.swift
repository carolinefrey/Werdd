//
//  DefinitionBoxDetailView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/21/22.
//

import UIKit

class DefinitionBoxDetailView: UIView {
    
    //MARK: - UI Properties
    
    var word = StaticWord(word: "", partOfSpeech: "", definition: "", synonyms: "", antonyms: "")
    
    let blueBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color1")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        return box
    }()
    
    let partOfSpeech: UILabel = {
        let partOfSpeech = UILabel()
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.textColor = .black
        partOfSpeech.font = UIFont(name: "Rubik-Italic", size: 14)
        return partOfSpeech
    }()
    
    let definition: UILabel = {
        let definition = UILabel()
        definition.translatesAutoresizingMaskIntoConstraints = false
        definition.textColor = .black
        definition.font = UIFont(name: "Rubik-Regular", size: 18)
        definition.lineBreakMode = .byTruncatingTail
        definition.numberOfLines = 3
        definition.adjustsFontSizeToFitWidth = true
        return definition
    }()
    
    let defBoxLabel: UILabel = {
        let boxLabel = UILabel()
        boxLabel.translatesAutoresizingMaskIntoConstraints = false
        boxLabel.text = "Definition"
        boxLabel.textColor = .white
        boxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
        return boxLabel
    }()
    
    //MARK: - Initializers
    
    init(word: StaticWord) {
        super.init(frame: CGRect.zero)

        self.word.partOfSpeech = word.partOfSpeech
        self.word.definition = word.definition
        partOfSpeech.text = word.partOfSpeech
        definition.text = word.definition

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UI Setup
    
    private func setup() {
        
        addSubview(blueBox)
        addSubview(partOfSpeech)
        addSubview(definition)
        addSubview(defBoxLabel)
        
        NSLayoutConstraint.activate([
            blueBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            blueBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            blueBox.heightAnchor.constraint(equalToConstant: 150),

            partOfSpeech.topAnchor.constraint(equalTo: blueBox.topAnchor, constant: 20),
            partOfSpeech.leadingAnchor.constraint(equalTo: blueBox.leadingAnchor, constant: 20),
            
            definition.topAnchor.constraint(equalTo: partOfSpeech.bottomAnchor, constant: 5),
            definition.leadingAnchor.constraint(equalTo: blueBox.leadingAnchor, constant: 20),
            definition.trailingAnchor.constraint(equalTo: blueBox.trailingAnchor, constant: -20),
            
            defBoxLabel.bottomAnchor.constraint(equalTo: blueBox.bottomAnchor, constant: -20),
            defBoxLabel.leadingAnchor.constraint(equalTo: blueBox.leadingAnchor, constant: 20),
        ])
    }
}
