//
//  AntonymsBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/24/22.
//

import UIKit

class AntonymsBoxView: UIView {
    
    var word = Word(word: "", partOfSpeech: "", definition: "", synonyms: "", antonyms: "")
    let pinkBox = UIView()
    let antonyms = UILabel()
    let antBoxLabel = UILabel()
    
    init(word: Word) {
        super.init(frame: CGRect.zero)

        self.word.antonyms = word.antonyms
        
        addSubview(pinkBox)
        addSubview(antonyms)
        addSubview(antBoxLabel)
        
        configurePinkBox()
        configureAntonyms()
        configureAntBoxLabel()
        
        setConstraints()
    }
    
    private func configurePinkBox() {
        pinkBox.backgroundColor = UIColor(named: "Color4")
        pinkBox.clipsToBounds = true
        pinkBox.layer.cornerRadius = 30
    }
    
    private func configureAntonyms() {
        antonyms.text = word.antonyms
        antonyms.textColor = .black
        antonyms.font = UIFont(name: "Rubik-Light", size: 14)
    }
    
    private func configureAntBoxLabel() {
        antBoxLabel.text = "Antonyms"
        antBoxLabel.textColor = .white
        antBoxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
    }
    
    private func setConstraints() {
        pinkBox.translatesAutoresizingMaskIntoConstraints = false
        antonyms.translatesAutoresizingMaskIntoConstraints = false
        antBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pinkBox.topAnchor.constraint(equalTo: topAnchor),
            pinkBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            pinkBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            pinkBox.heightAnchor.constraint(equalToConstant: 95),
            
            antonyms.topAnchor.constraint(equalTo: pinkBox.topAnchor, constant: 20),
            antonyms.leadingAnchor.constraint(equalTo: pinkBox.leadingAnchor, constant: 20),
            antonyms.trailingAnchor.constraint(equalTo: pinkBox.trailingAnchor, constant: -20),
            
            antBoxLabel.bottomAnchor.constraint(equalTo: pinkBox.bottomAnchor, constant: -20),
            antBoxLabel.leadingAnchor.constraint(equalTo: pinkBox.leadingAnchor, constant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
