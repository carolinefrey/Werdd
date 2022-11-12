//
//  SynonymsBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/24/22.
//

import UIKit

class SynonymsBoxView: UIView {
    
    //MARK: - UI Properties

    var word = Word()
    
    let greenBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color3")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        return box
    }()
    
    let synonyms: UILabel = {
        let synonyms = UILabel()
        synonyms.translatesAutoresizingMaskIntoConstraints = false
        synonyms.textColor = .black
        synonyms.font = UIFont(name: "Rubik-Light", size: 14)
        return synonyms
    }()
    
    let synBoxLabel: UILabel = {
        let boxLabel = UILabel()
        boxLabel.translatesAutoresizingMaskIntoConstraints = false
        boxLabel.text = "Synonyms"
        boxLabel.textColor = .white
        boxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
        return boxLabel
    }()
    
    //MARK: - Initializers

    init(word: Word) {
        super.init(frame: CGRect.zero)

        self.word.synonyms = word.synonyms
        synonyms.text = word.synonyms?.joined(separator: ", ")
        
        setup()
    }
    
    //MARK: - UI Setup
    
    private func setup() {
        
        addSubview(greenBox)
        addSubview(synonyms)
        addSubview(synBoxLabel)

        NSLayoutConstraint.activate([
            greenBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            greenBox.heightAnchor.constraint(equalToConstant: 150),
            
            synonyms.topAnchor.constraint(equalTo: greenBox.topAnchor, constant: 20),
            synonyms.leadingAnchor.constraint(equalTo: greenBox.leadingAnchor, constant: 20),
            synonyms.trailingAnchor.constraint(equalTo: greenBox.trailingAnchor, constant: -20),
            
            synBoxLabel.bottomAnchor.constraint(equalTo: greenBox.bottomAnchor, constant: -20),
            synBoxLabel.leadingAnchor.constraint(equalTo: greenBox.leadingAnchor, constant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
