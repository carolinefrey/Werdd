//
//  ViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/4/22.
//

import UIKit

let wordArray = [
    ["Programming", "noun", "creating a sequence of instructions to enable the computer to do something"],
    ["Algorithm", "noun", "specific procedures used to solve computational problems"],
    ["Compile", "verb", "convert (a program) into a machine-code or lower-level form in which the program can be executed."],
    ["Latency", "noun", "measure of time between entering an input and the returned output"],
    ["Syntax", "noun", "the rules that dictate the structure of a language"],
    ["Bug", "noun", "a programming error that causes unexpected glitches or problems for a program’s end user"],
    ["CPU", "noun", "stands for the Central Processing Unit. It is the processing chip that serves as the brains of a device that interprets (or processes) the digital instructions provided by applications"],
    ["Bit", "noun", "an abbreviation for “binary digit,” the smallest piece of information used by a computer"],
    ["Conditional statements", "noun", "another fundamental piece of programming instructions, set the terms for when a program moves forward"],
    ["Bandwidth", "noun", "the amount of information that hard-wired or wireless connections can process or transmit"],
]

let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
let buttonSymbol = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: largeConfig)

var wordChoice = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //UITableViewDelegate NOT used in V3, might need for V5
    
    let werddTitle: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont(name: "Rubik-Bold", size: 36)
        text.text = "Werdd."
        text.textAlignment = .left
        
        return text
    }()
    
    let definitionBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "Color1")
        box.clipsToBounds = true
        box.layer.cornerRadius = 30
        
        return box
    }()
    
    let word: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        label.text = wordArray[0][0]
        
        return label
    }()
    
    let partOfSpeech: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Italic", size: 12)
        label.text = wordArray[0][1]
        
        return label
    }()
    
    let definition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light", size: 16)
        label.text = wordArray[0][2]
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let wordAndPartofSpeechStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .lastBaseline
        stack.distribution = .fill
        stack.spacing = 10
        
        return stack
    }()
    
    let fullDefinitionStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 10
        
        return stack
    }()
    
    let newWordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(buttonSymbol, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(newWordButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.clipsToBounds = true
        table.layer.cornerRadius = 30
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(named: "Color5")
        setUpUI()
    }
    
    func setUpUI() {
        
        view.addSubview(werddTitle)
        view.addSubview(definitionBox)
        view.addSubview(fullDefinitionStack)
        view.addSubview(newWordButton)
        
        wordAndPartofSpeechStack.addArrangedSubview(word)
        wordAndPartofSpeechStack.addArrangedSubview(partOfSpeech)
        
        fullDefinitionStack.addArrangedSubview(wordAndPartofSpeechStack)
        fullDefinitionStack.addArrangedSubview(definition)
        
        //TABLEVIEW
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self //self means the current class (in this case the class is ViewController) conforms to the protocol
        tableView.delegate = self //NOT used in V3, might need for V5
                
        NSLayoutConstraint.activate([
            werddTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            werddTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            definitionBox.topAnchor.constraint(equalTo: werddTitle.bottomAnchor, constant: 20),
            definitionBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            definitionBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            definitionBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            fullDefinitionStack.topAnchor.constraint(equalTo: definitionBox.topAnchor, constant: 20),
            fullDefinitionStack.leadingAnchor.constraint(equalTo: definitionBox.leadingAnchor, constant: 20),
            fullDefinitionStack.trailingAnchor.constraint(equalTo: definitionBox.trailingAnchor, constant: -20),
            
            newWordButton.trailingAnchor.constraint(equalTo: definitionBox.trailingAnchor, constant: -20),
            newWordButton.bottomAnchor.constraint(equalTo: definitionBox.bottomAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: definitionBox.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //Two methods required for UITableViewDataSource conformance
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count //number of rows in table
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        var config = cell.defaultContentConfiguration()
        config.text = "\(wordArray[indexPath.row][0])"
        config.secondaryText = "\(wordArray[indexPath.row][2])"

        config.secondaryTextProperties.lineBreakMode = .byTruncatingTail
        config.secondaryTextProperties.numberOfLines = 1
        
        config.textProperties.font = UIFont(name: "Rubik-Light", size: 14)!
        config.secondaryTextProperties.font = UIFont(name: "Rubik-Light", size: 12)!

        
        
        cell.contentConfiguration = config
        return cell
    }
    
    @objc func newWordButtonPressed() {
        wordChoice = Int.random(in: 0..<wordArray.count)
        word.text = wordArray[wordChoice][0]
        partOfSpeech.text = wordArray[wordChoice][1]
        definition.text = wordArray[wordChoice][2]
    }
}
