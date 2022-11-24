//
//  FavoriteWord+CoreDataProperties.swift
//  Werdd
//
//  Created by Caroline Frey on 11/17/22.
//

import Foundation
import CoreData

extension FavoriteWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteWord> {
        return NSFetchRequest<FavoriteWord>(entityName: "FavoriteWord")
    }

    @NSManaged public var word: String
    @NSManaged public var definition: String
    @NSManaged public var partOfSpeech: String

}

extension FavoriteWord : Identifiable {

}
