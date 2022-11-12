//
//  Words.swift
//  Werdd
//
//  Created by Caroline Frey on 10/18/22.
//

import Foundation

class Words {
    let wordArray: [StaticWord] = [
        StaticWord(word: "Programming", partOfSpeech: "noun", definition: "creating a sequence of instructions to enable the computer to do something", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Algorithm", partOfSpeech: "noun", definition: "specific procedures used to solve computational problems", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Compile", partOfSpeech: "verb", definition: "convert (a program) into a machine-code or lower-level form in which the program can be executed.", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Latency", partOfSpeech: "noun", definition: "measure of time between entering an input and the returned output", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Syntax", partOfSpeech: "noun", definition: "the rules that dictate the structure of a language", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Bug", partOfSpeech: "noun", definition: "a programming error that causes unexpected glitches or problems for a program's end user", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "CPU", partOfSpeech: "noun", definition: "stands for the Central Processing Unit. It is the processing chip that serves as the brains of a device that interprets (or processes) the digital instructions provided by applications", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Bit", partOfSpeech: "noun", definition: "an abbreviation for “binary digit,” the smallest piece of information used by a computer", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Conditional statements", partOfSpeech: "noun", definition: "another fundamental piece of programming instructions, set the terms for when a program moves forward", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
        StaticWord(word: "Bandwidth", partOfSpeech: "noun", definition: "the amount of information that hard-wired or wireless connections can process or transmit", synonyms: "syn1, syn2, syn3", antonyms: "ant1, ant2, ant3"),
    ]
}

class StaticWord {
    var word: String
    var partOfSpeech: String
    var definition: String
    var synonyms: String
    var antonyms: String
    
    init(word: String, partOfSpeech: String, definition: String, synonyms: String, antonyms: String) {
        self.word = word
        self.partOfSpeech = partOfSpeech
        self.definition = definition
        self.synonyms = synonyms
        self.antonyms = antonyms
    }
}

//MARK: - Random Word objects

struct RandomWord: Codable {
    let word: String
    let results: [Result]
}

struct Result: Codable {
    let definition: String
    let partOfSpeech: String
}

//MARK: - Get a Word objects

struct SearchedWord: Codable {
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let definition: String
    let partOfSpeech: String
    let synonyms: [String]?
}
