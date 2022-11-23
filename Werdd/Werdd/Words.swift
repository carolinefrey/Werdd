//
//  Words.swift
//  Werdd
//
//  Created by Caroline Frey on 10/18/22.
//

import Foundation

struct Word {
    var word: String
    var partOfSpeech: String
    var definition: String
    var synonyms: [String]?
    
    init(word: String = "", partOfSpeech: String = "", definition: String = "", synonyms: [String] = [], antonyms: [String] = []) {
        self.word = word
        self.partOfSpeech = partOfSpeech
        self.definition = definition
        self.synonyms = synonyms
    }
    
    init(word: String, searchResult: SearchResult) {
        self.word = word
        self.partOfSpeech = searchResult.partOfSpeech
        self.definition = searchResult.definition
        self.synonyms = searchResult.synonyms
    }
}

//MARK: - Random Word

struct RandomWord: Codable {
    let word: String
    let results: [Result]?
}

struct Result: Codable {
    let definition: String
    let partOfSpeech: String
}

//MARK: - Get a Word

struct SearchedWord: Codable {
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let definition: String
    let partOfSpeech: String
    let synonyms: [String]?
}

//MARK: - Get Word Details, Antonyms
struct Antonyms: Codable {
    let antonyms: [String]
}

//MARK: - Get Word Details, Examples
struct ExampleUsage: Codable {
    let examples: [String]
}
