//
//  DefinitionBoxDetailView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/21/22.
//

import UIKit

class DefinitionBoxDetailView: UIView {
    
    let box = UIView()
    let partOfSpeech = UILabel()
    let definition = UILabel()
    let defBoxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(box)
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
        box.backgroundColor = UIColor(named: "Color1")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
    }
    
    private func configurePartOfSpeech() {
        partOfSpeech.text = "POS"
        partOfSpeech.textColor = .black
        partOfSpeech.font = UIFont(name: "Rubik-Italic", size: 14)
    }
    
    private func configureDefinition() {
        definition.text = "Selected word definition"
        definition.textColor = .black
        definition.font = UIFont(name: "Rubik-Regular", size: 20)
    }
    
    private func configureDefBoxLabel() {
        defBoxLabel.text = "Definition"
        defBoxLabel.textColor = .white
        defBoxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
    }
    
    private func setConstraints() {
        box.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        definition.translatesAutoresizingMaskIntoConstraints = false
        defBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            box.topAnchor.constraint(equalTo: topAnchor),
            box.leadingAnchor.constraint(equalTo: leadingAnchor),
            box.trailingAnchor.constraint(equalTo: trailingAnchor),
            box.heightAnchor.constraint(equalToConstant: 150),
            
            partOfSpeech.topAnchor.constraint(equalTo: box.topAnchor, constant: 20),
            partOfSpeech.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 20),
            
            definition.topAnchor.constraint(equalTo: partOfSpeech.bottomAnchor, constant: 5),
            definition.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 20),
            definition.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: -20),
            
            defBoxLabel.bottomAnchor.constraint(equalTo: box.bottomAnchor, constant: -20),
            defBoxLabel.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
