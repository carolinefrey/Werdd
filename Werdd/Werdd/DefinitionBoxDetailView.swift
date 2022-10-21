//
//  DefinitionBoxDetailView.swift
//  Werdd
//
//  Created by Caroline Frey on 10/21/22.
//

import UIKit

class DefinitionBoxDetailView: UIView {
    
    var partOfSpeech = UILabel()
    var definition = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(partOfSpeech)
        addSubview(definition)
        
        configurePartOfSpeech()
        configureDefinition()
        
        setConstraints()
    }
    
    private func configurePartOfSpeech() {

    }
    
    private func configureDefinition() {
        
    }
    
    private func setConstraints() {
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        definition.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
