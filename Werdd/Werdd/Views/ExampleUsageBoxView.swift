//
//  ExampleUsageBoxView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/24/22.
//

import UIKit

class ExampleUsageBoxView: UIView {
    
    let orangeBox = UIView()
    let example1 = UILabel()
    let example2 = UILabel()
    let example3 = UILabel()
    let usageBoxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(orangeBox)
        addSubview(example1)
        addSubview(example2)
        addSubview(example3)
        addSubview(usageBoxLabel)
        
        configureOrangeBox()
        configureExample1()
        configureExample2()
        configureExample2()
        configureUsageBoxLabel()
        
        setConstraints()
    }
    
    private func configureOrangeBox() {
        orangeBox.backgroundColor = UIColor(named: "Color6")
        orangeBox.clipsToBounds = true
        orangeBox.layer.cornerRadius = 30
    }
    
    private func configureExample1() {
        example1.text = "Example usage sentence"
        example1.textColor = .black
        example1.font = UIFont(name: "Rubik-Light", size: 12)
    }
    
    private func configureExample2() {
        example2.text = "Example usage sentence"
        example2.textColor = .black
        example2.font = UIFont(name: "Rubik-Light", size: 12)
    }
    
    private func configureExample3() {
        example3.text = "Example usage sentence"
        example3.textColor = .black
        example3.font = UIFont(name: "Rubik-Light", size: 12)
    }
    
    private func configureUsageBoxLabel() {
        usageBoxLabel.text = "Example Usage"
        usageBoxLabel.textColor = .white
        usageBoxLabel.font = UIFont(name: "Rubik-Regular", size: 12)
    }
    
    private func setConstraints() {
        orangeBox.translatesAutoresizingMaskIntoConstraints = false
        example1.translatesAutoresizingMaskIntoConstraints = false
        example2.translatesAutoresizingMaskIntoConstraints = false
        example3.translatesAutoresizingMaskIntoConstraints = false
        usageBoxLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orangeBox.topAnchor.constraint(equalTo: topAnchor),
            orangeBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            orangeBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            orangeBox.heightAnchor.constraint(equalToConstant: 150),
            
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
