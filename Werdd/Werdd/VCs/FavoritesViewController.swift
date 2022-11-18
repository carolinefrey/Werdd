//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 11/17/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    //MARK: - UI Properties
    
    private var favorites = [FavoriteWord]()

    let favoritesTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Rubik-Bold", size: 36)
        title.text = "Favorites"
        title.textAlignment = .left
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 30
        tableView.rowHeight = 70
        return tableView
    }()
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
    
        DataManager.fetchFavoriteWords { [weak self] favoriteWords in
            if let favoriteWords = favoriteWords {
                favorites = favoriteWords
                
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }
        }
        
        setup()
    }
    
    //MARK: - UI Setup
    
    private func setup() {
        view.addSubview(favoritesTitle)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.favoritesTableViewCellIdentifier)
        
        NSLayoutConstraint.activate([
            favoritesTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            favoritesTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: favoritesTitle.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    //MARK: - Functions

}

//MARK: UITableViewDataSource Methods

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count //number of rows in table
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.favoritesTableViewCellIdentifier) as! FavoritesTableViewCell
        let currentWord = favorites[indexPath.row]
        cell.setFavoriteWords(word: currentWord)
        
        return cell
    }
}

//MARK: UITableViewDelegate Methods

extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = Word(word: favorites[indexPath.row].word, partOfSpeech: favorites[indexPath.row].partOfSpeech, definition: favorites[indexPath.row].definition, synonyms: [], antonyms: [])
        let detailVC = DetailViewController(word: word, antonyms: "", exampleUsage: "")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            DataManager.deleteFavoriteWord(item: self.favorites[indexPath.row])
            tableView.beginUpdates()
            self.favorites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}
