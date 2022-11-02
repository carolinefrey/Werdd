//
//  CustomCollectionViewCell.swift
//  Werdd
//
//  Created by Caroline Frey on 11/1/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var backgroundCell = UIView()
    var wordLabel = UILabel()
    var partOfSpeechLabel = UILabel()
    var definitionLabel = UILabel()
    
    static let identifier = "CustomCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(backgroundCell)
        addSubview(wordLabel)
        addSubview(partOfSpeechLabel)
        addSubview(definitionLabel)
        
        configureBackgroundCell()
        configureWord()
        configurePartOfSpeech()
        configureDefinition()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(word: Word) {
        wordLabel.text = word.word
        partOfSpeechLabel.text = word.partOfSpeech
        definitionLabel.text = word.definition
    }
    
    func configureBackgroundCell() {
        backgroundCell.backgroundColor = UIColor(named: "Color2")
        backgroundCell.clipsToBounds = true
        backgroundCell.layer.cornerRadius = 20
    }
    
    func configureWord() {
        wordLabel.text = "Word"
        wordLabel.font = UIFont(name: "Rubik-Bold", size: 16)!
        wordLabel.clipsToBounds = true
        wordLabel.lineBreakMode = .byTruncatingTail
    }
    
    func configurePartOfSpeech() {
        partOfSpeechLabel.text = "Part of speech"
        partOfSpeechLabel.font = UIFont(name: "Rubik-Italic", size: 12)!
        partOfSpeechLabel.clipsToBounds = true
    }
    
    func configureDefinition() {
        definitionLabel.text = "Definition"
        definitionLabel.font = UIFont(name: "Rubik-Light", size: 12)!
        definitionLabel.clipsToBounds = true
        definitionLabel.lineBreakMode = .byTruncatingTail
    }
    
    func setConstraints() {
        backgroundCell.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            wordLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            wordLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            
            partOfSpeechLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            partOfSpeechLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            partOfSpeechLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            
            definitionLabel.topAnchor.constraint(equalTo: partOfSpeechLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            definitionLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10)
        ])
    }
}
