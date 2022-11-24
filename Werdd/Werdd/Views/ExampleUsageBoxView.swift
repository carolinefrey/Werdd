//
//  ExampleUsageBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/24/22.
//

import UIKit

class ExampleUsageBoxView: UIView {
    
    //MARK: - UI Properties

    let orangeBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color6")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        return box
    }()
    
    let example: UILabel = {
        let example = UILabel()
        example.translatesAutoresizingMaskIntoConstraints = false
        example.textColor = .black
        example.font = UIFont(name: "Rubik-Regular", size: 16)
        example.lineBreakMode = .byWordWrapping
        example.numberOfLines = 4
        return example
    }()
    
    let usageBoxLabel: UILabel = {
        let boxLabel = UILabel()
        boxLabel.translatesAutoresizingMaskIntoConstraints = false
        boxLabel.text = "Example Usage"
        boxLabel.textColor = .white
        boxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
        return boxLabel
    }()
    
    //MARK: - Initializers

    init(usage: [String]) {
        super.init(frame: CGRect.zero)
        let usageString = usage.joined(separator: ".\n")
        self.example.text = usageString
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

    private func setup() {
        
        addSubview(orangeBox)
        addSubview(example)
        addSubview(usageBoxLabel)
        
        NSLayoutConstraint.activate([
            orangeBox.heightAnchor.constraint(equalToConstant: 150),
            orangeBox.widthAnchor.constraint(equalTo: widthAnchor),
            
            example.topAnchor.constraint(equalTo: orangeBox.topAnchor, constant: 20),
            example.leadingAnchor.constraint(equalTo: orangeBox.leadingAnchor, constant: 20),
            example.trailingAnchor.constraint(equalTo: orangeBox.trailingAnchor, constant: -20),
            
            usageBoxLabel.bottomAnchor.constraint(equalTo: orangeBox.bottomAnchor, constant: -20),
            usageBoxLabel.leadingAnchor.constraint(equalTo: orangeBox.leadingAnchor, constant: 20),
        ])
    }
}
