//
//  DefinitionBoxDetailView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/21/22.
//

import UIKit

class DefinitionBoxDetailView: UIView {
    
    var word = Word(word: "", partOfSpeech: "", definition: "", synonyms: "", antonyms: "")
    let blueBox = UIView()
    let partOfSpeech = UILabel()
    let definition = UILabel()
    let defBoxLabel = UILabel()
    
    init(word: Word) {
        super.init(frame: CGRect.zero)

        self.word.partOfSpeech = word.partOfSpeech
        self.word.definition = word.definition

        addSubview(blueBox)
        addSubview(partOfSpeech)
        addSubview(definition)
        addSubview(defBoxLabel)
        
        configureBox()
        configurePartOfSpeech()
        configureDefinition()
        configureDefBoxLabel()
        
        setConstraints()
    }
    
    private func configureBox() {
        blueBox.backgroundColor = UIColor(named: "Color1")
        blueBox.clipsToBounds = true
        blueBox.layer.cornerRadius = 30
    }
    
    private func configurePartOfSpeech() {
        partOfSpeech.text = word.partOfSpeech
        partOfSpeech.textColor = .black
        partOfSpeech.font = UIFont(name: "Rubik-Italic", size: 14)
    }
    
    private func configureDefinition() {
        definition.text = word.definition
        definition.textColor = .black
        definition.font = UIFont(name: "Rubik-Regular", size: 20)
    }
    
    private func configureDefBoxLabel() {
        defBoxLabel.text = "Definition"
        defBoxLabel.textColor = .white
        defBoxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
    }
    
    private func setConstraints() {
        blueBox.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        definition.translatesAutoresizingMaskIntoConstraints = false
        defBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blueBox.topAnchor.constraint(equalTo: topAnchor),
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
