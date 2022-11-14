//
//  DetailViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/19/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedWord = Word()
    
    let wordTitle: UILabel = {
        let wordTitle = UILabel()
        wordTitle.translatesAutoresizingMaskIntoConstraints = false
        wordTitle.textColor = .black
        wordTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        wordTitle.textAlignment = .left
        wordTitle.lineBreakMode = .byWordWrapping
        wordTitle.numberOfLines = 0
        wordTitle.adjustsFontSizeToFitWidth = true
        return wordTitle
    }()
    
    var definitionBox: DefinitionBoxDetailView
    var synonymsBox: SynonymsBoxView
    var antonymsBox: AntonymsBoxView
    var exampleBox: ExampleUsageBoxView
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 160
        return stackView
    }()
    
    init(word: Word, antonyms: String, exampleUsage: String) {
        self.selectedWord = word

        wordTitle.text = word.word
        definitionBox = DefinitionBoxDetailView(word: word)
        synonymsBox = SynonymsBoxView(word: word)
        antonymsBox = AntonymsBoxView(antonyms: antonyms)
        exampleBox = ExampleUsageBoxView(usage: exampleUsage)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        setup()
    }

    private func setup() {

        view.addSubview(wordTitle)
        view.addSubview(stackView)

        definitionBox.translatesAutoresizingMaskIntoConstraints = false
        synonymsBox.translatesAutoresizingMaskIntoConstraints = false
        antonymsBox.translatesAutoresizingMaskIntoConstraints = false
        exampleBox.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(definitionBox)
        stackView.addArrangedSubview(synonymsBox)
        stackView.addArrangedSubview(antonymsBox)
        stackView.addArrangedSubview(exampleBox)

        NSLayoutConstraint.activate([
            wordTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            wordTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),

            definitionBox.blueBox.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            synonymsBox.greenBox.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            antonymsBox.pinkBox.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            exampleBox.orangeBox.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            stackView.topAnchor.constraint(equalTo: wordTitle.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}
