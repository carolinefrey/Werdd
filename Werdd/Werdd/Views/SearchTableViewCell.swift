//
//  CustomTableViewCell.swift
//  Werdd
//
//  Created by Caroline Frey on 10/13/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    //MARK: - UI Properties
    
    var backgroundCell: UIView = {
        let cell = UIView()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.backgroundColor = UIColor(named: "Color2")
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }()
    
    var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Word"
        label.font = UIFont(name: "Rubik-Bold", size: 16)!
        label.clipsToBounds = true
        return label
    }()
    
    var partOfSpeechLabel: UILabel = {
        let partOfSpeechLabel = UILabel()
        partOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechLabel.text = "Part of speech"
        partOfSpeechLabel.font = UIFont(name: "Rubik-Italic", size: 12)!
        partOfSpeechLabel.clipsToBounds = true
        return partOfSpeechLabel
    }()
    
    var definitionLabel: UILabel = {
        let defLabel = UILabel()
        defLabel.translatesAutoresizingMaskIntoConstraints = false
        defLabel.text = "Definition"
        defLabel.font = UIFont(name: "Rubik-Light", size: 12)!
        defLabel.clipsToBounds = true
        defLabel.lineBreakMode = .byTruncatingTail
        return defLabel
    }()
    
    static let searchTableViewCellIdentifier = "CustomTableViewCell"
    
    //MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFetchedResults(word: Word) {
        wordLabel.text = word.word
        partOfSpeechLabel.text = word.partOfSpeech
        definitionLabel.text = word.definition
    }
    
    //MARK: - UI Setup
    
    private func setup() {
        
        addSubview(backgroundCell)
        addSubview(wordLabel)
        addSubview(partOfSpeechLabel)
        addSubview(definitionLabel)
        
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
