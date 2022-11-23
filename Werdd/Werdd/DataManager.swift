//
//  DataManager.swift
//  Werdd
//
//  Created by Caroline Frey on 11/17/22.
//

import Foundation
import CoreData
import UIKit


class DataManager {
    
    static let managedObjectContext: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    // MARK: - Create
    
    static func addFavoriteWord(word: String, definition: String?, partOfSpeech: String?) {
        
        let favoritedWord = FavoriteWord(context: managedObjectContext)
        favoritedWord.word = word
        favoritedWord.definition = definition ?? "Definition not found"
        favoritedWord.partOfSpeech = partOfSpeech ?? "Part of speech not found"
        
        do {
            try managedObjectContext.save()
        }
        catch {
            
        }
    }
    
    // MARK: - Read
    
    static func fetchFavoriteWords(completion: ([FavoriteWord]?) -> Void) {
        do {
            let favoriteWords = try managedObjectContext.fetch(FavoriteWord.fetchRequest())
            completion(favoriteWords)
        }
        catch {
            
        }
        
        completion(nil)
    }
    
    static func fetchFavoriteWord(word: String, completion: (FavoriteWord?) -> Void) {
        
        let fetchRequest = NSFetchRequest<FavoriteWord>(entityName: "FavoriteWord")
        fetchRequest.predicate = NSPredicate(format: "word == %@", word)
        
        do {
            let word = try managedObjectContext.fetch(fetchRequest)
            completion(word.first)
        }
        catch {
            print("Could not fetch due to error: \(error.localizedDescription)")
        }
        
        completion(nil)
    }
    
    // MARK: - Update
//
//    static func updateToDo(item: FavoriteWord, word: String, definition: String, partOfSpeech: String) {
//
//        item.word = word
//        item.definition = definition
//        item.partOfSpeech = partOfSpeech
//
//        do {
//            try managedObjectContext.save()
//        }
//        catch {
//
//        }
//    }
    
    // MARK: - Delete
    
    static func deleteFavoriteWord(item: FavoriteWord) {
        managedObjectContext.delete(item)
        
        do {
            try managedObjectContext.save()
        }
        catch {
            
        }
    }
}
