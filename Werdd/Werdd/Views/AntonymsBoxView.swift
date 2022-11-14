//
//  AntonymsBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/24/22.
//

import UIKit

class AntonymsBoxView: UIView {
    
    //MARK: - UI Properties
    
    let pinkBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color4")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        return box
    }()
    
    let antonyms: UILabel = {
        let antonyms = UILabel()
        antonyms.translatesAutoresizingMaskIntoConstraints = false
        antonyms.textColor = .black
        antonyms.font = UIFont(name: "Rubik-Regular", size: 18)
        return antonyms
    }()
    
    let antBoxLabel: UILabel = {
        let boxLabel = UILabel()
        boxLabel.translatesAutoresizingMaskIntoConstraints = false
        boxLabel.text = "Antonyms"
        boxLabel.textColor = .white
        boxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
        return boxLabel
    }()
    
    //MARK: - Initializers

    init(antonyms: String) {
        super.init(frame: CGRect.zero)
        
        self.antonyms.text = antonyms
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

    private func setup() {
        
        addSubview(pinkBox)
        addSubview(antonyms)
        addSubview(antBoxLabel)
        
        NSLayoutConstraint.activate([
            pinkBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            pinkBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            pinkBox.heightAnchor.constraint(equalToConstant: 150),
            
            antonyms.topAnchor.constraint(equalTo: pinkBox.topAnchor, constant: 20),
            antonyms.leadingAnchor.constraint(equalTo: pinkBox.leadingAnchor, constant: 20),
            antonyms.trailingAnchor.constraint(equalTo: pinkBox.trailingAnchor, constant: -20),
            
            antBoxLabel.bottomAnchor.constraint(equalTo: pinkBox.bottomAnchor, constant: -20),
            antBoxLabel.leadingAnchor.constraint(equalTo: pinkBox.leadingAnchor, constant: 20),
        ])
    }
}
