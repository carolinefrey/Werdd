//
//  SynonymsBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/24/22.
//

import UIKit

class SynonymsBoxView: UIView {

    let greenBox = UIView()
    let synonyms = UILabel()
    let synBoxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(greenBox)
        addSubview(synonyms)
        addSubview(synBoxLabel)
        
        configureGreenBox()
        configureSynonyms()
        configureSynBoxLabel()
        
        setConstraints()
    }
    
    private func configureGreenBox() {
        greenBox.backgroundColor = UIColor(named: "Color3")
        greenBox.clipsToBounds = true
        greenBox.layer.cornerRadius = 30
    }
    
    private func configureSynonyms() {
        synonyms.text = "Selected word synonyms"
        synonyms.textColor = .black
        synonyms.font = UIFont(name: "Rubik-Light", size: 14)
    }
    
    private func configureSynBoxLabel() {
        synBoxLabel.text = "Synonyms"
        synBoxLabel.textColor = .white
        synBoxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
    }
    
    private func setConstraints() {
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        synonyms.translatesAutoresizingMaskIntoConstraints = false
        synBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greenBox.topAnchor.constraint(equalTo: topAnchor),
            greenBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            greenBox.heightAnchor.constraint(equalToConstant: 95),
            
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
