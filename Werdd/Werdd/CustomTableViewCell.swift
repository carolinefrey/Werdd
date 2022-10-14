//
//  CustomTableViewCell.swift
//  Werdd
//
//  Created by Caroline Frey on 10/13/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var backgroundCell = UIView()
    var wordLabel = UILabel()
    var partOfSpeechLabel = UILabel()
    var definitionLabel = UILabel()
    
    static let identifier = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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

    func set(word: Word) {
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
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            wordLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 20),
            wordLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 8),
            
            partOfSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 5),
            partOfSpeechLabel.bottomAnchor.constraint(equalTo: wordLabel.bottomAnchor),
            
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -20)
        ])
    }
}
