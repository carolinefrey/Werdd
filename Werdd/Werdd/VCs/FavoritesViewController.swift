//
//  FavoritesViewController.swift
//  Werdd
//
//  Created by Caroline Frey on 11/17/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    //MARK: - UI Properties
    
    let favoritesTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Rubik-Bold", size: 36)
        title.text = "Favorites"
        title.textAlignment = .left
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named: "Color5")
        
        setup()
    }
    
    //MARK: - UI Setup
    
    private func setup() {
        view.addSubview(favoritesTitle)
        
        NSLayoutConstraint.activate([
            favoritesTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            favoritesTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }

    //MARK: - Functions

    //MARK: UITableViewDataSource Methods

    //MARK: UITableViewDelegate Methods

}
