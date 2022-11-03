//
//  ViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    let words = Words()
    let werddTitle = UILabel()
    let definitionBoxView = DefinitionBoxView()
    lazy var newWordButton = UIButton()
    
    lazy var collectionViewLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        
        view.addSubview(werddTitle)
        view.addSubview(definitionBoxView)
        view.addSubview(newWordButton)
        view.addSubview(collectionView)
        
        configureWerddTitle()
        configureNewWordButton()
        
        configureCollectionViewLayout()
        configureCollectionView()
        
        setConstraints()
    }
    
    //MARK: - Configure Views
    func configureWerddTitle() {
        werddTitle.font = UIFont(name: "Rubik-Bold", size: 36)
        werddTitle.text = "Werdd."
        werddTitle.textAlignment = .left
    }
    
    func configureNewWordButton() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
        let buttonSymbol = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: largeConfig)
        
        newWordButton.setImage(buttonSymbol, for: .normal)
        newWordButton.tintColor = .white
        newWordButton.addTarget(self, action: #selector(newWordButtonPressed), for: .touchUpInside)
    }
    
    func configureCollectionViewLayout() {
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: 180, height: 90)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }

    //MARK: - Set Constraints
    func setConstraints() {
        werddTitle.translatesAutoresizingMaskIntoConstraints = false
        definitionBoxView.translatesAutoresizingMaskIntoConstraints = false
        newWordButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            werddTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            werddTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
            newWordButton.trailingAnchor.constraint(equalTo: definitionBoxView.trailingAnchor, constant: -40),
            newWordButton.bottomAnchor.constraint(equalTo: definitionBoxView.bottomAnchor),
            
            definitionBoxView.topAnchor.constraint(equalTo: werddTitle.bottomAnchor),
            definitionBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            definitionBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            definitionBoxView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
        
            collectionView.topAnchor.constraint(equalTo: definitionBoxView.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //MARK: - Button Methods
    @objc func newWordButtonPressed() {
        let randomWord = randomizedWord()
        updateDefinitionBox(withword: randomWord)
    }
    
    func randomizedWord() -> Word? {
        return words.wordArray.randomElement()
    }
    
    func updateDefinitionBox(withword wordChoice: Word?) {
        definitionBoxView.word.text = wordChoice?.word
        definitionBoxView.partOfSpeech.text = wordChoice?.partOfSpeech
        definitionBoxView.definition.text = wordChoice?.definition
    }
}


//MARK: - UICollectionViewDataSource Methods
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.wordArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        let currentWord = words.wordArray[indexPath.row]
        cell.configure(word: currentWord)
        return cell
    }
}

//MARK: - UICollectionViewDelegate Methods
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController(selectedWord: words.wordArray[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
