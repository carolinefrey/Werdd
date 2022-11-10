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
    
    let example1: UILabel = {
        let example1 = UILabel()
        example1.translatesAutoresizingMaskIntoConstraints = false
        example1.text = "Example usage sentence"
        example1.textColor = .black
        example1.font = UIFont(name: "Rubik-Light", size: 14)
        return example1
    }()
    
    let example2: UILabel = {
        let example2 = UILabel()
        example2.translatesAutoresizingMaskIntoConstraints = false
        example2.text = "Example usage sentence"
        example2.textColor = .black
        example2.font = UIFont(name: "Rubik-Light", size: 14)
        return example2
    }()
    
    let example3: UILabel = {
        let example3 = UILabel()
        example3.translatesAutoresizingMaskIntoConstraints = false
        example3.text = "Example usage sentence"
        example3.textColor = .black
        example3.font = UIFont(name: "Rubik-Light", size: 14)
        return example3
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup

    private func setup() {
        
        addSubview(orangeBox)
        addSubview(example1)
        addSubview(example2)
        addSubview(example3)
        addSubview(usageBoxLabel)
        
        NSLayoutConstraint.activate([
            orangeBox.heightAnchor.constraint(equalToConstant: 150),
            orangeBox.widthAnchor.constraint(equalTo: widthAnchor),
            
            example1.topAnchor.constraint(equalTo: orangeBox.topAnchor, constant: 20),
            example1.leadingAnchor.constraint(equalTo: orangeBox.leadingAnchor, constant: 20),
            example1.trailingAnchor.constraint(equalTo: orangeBox.trailingAnchor, constant: -20),
            
            example2.topAnchor.constraint(equalTo: example1.bottomAnchor, constant: 20),
            example2.leadingAnchor.constraint(equalTo: orangeBox.leadingAnchor, constant: 20),
            example2.trailingAnchor.constraint(equalTo: orangeBox.trailingAnchor, constant: -20),
            
            example3.topAnchor.constraint(equalTo: example2.bottomAnchor, constant: 20),
            example3.leadingAnchor.constraint(equalTo: orangeBox.leadingAnchor, constant: 20),
            example3.trailingAnchor.constraint(equalTo: orangeBox.trailingAnchor, constant: -20),
            
            usageBoxLabel.bottomAnchor.constraint(equalTo: orangeBox.bottomAnchor, constant: -20),
            usageBoxLabel.leadingAnchor.constraint(equalTo: orangeBox.leadingAnchor, constant: 20),
        ])
    }
}
