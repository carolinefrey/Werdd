//
//  Words.swift
//  Werdd
//
//  Created by Caroline Frey on 10/18/22.
//

import Foundation

class Words {
    let wordArray: [Word] = [
        Word(word: "Programming", partOfSpeech: "noun", definition: "creating a sequence of instructions to enable the computer to do something"),
        Word(word: "Algorithm", partOfSpeech: "noun", definition: "specific procedures used to solve computational problems"),
        Word(word: "Compile", partOfSpeech: "verb", definition: "convert (a program) into a machine-code or lower-level form in which the program can be executed."),
        Word(word: "Latency", partOfSpeech: "noun", definition: "measure of time between entering an input and the returned output"),
        Word(word: "Syntax", partOfSpeech: "noun", definition: "the rules that dictate the structure of a language"),
        Word(word: "Bug", partOfSpeech: "noun", definition: "a programming error that causes unexpected glitches or problems for a program's end user"),
        Word(word: "CPU", partOfSpeech: "noun", definition: "stands for the Central Processing Unit. It is the processing chip that serves as the brains of a device that interprets (or processes) the digital instructions provided by applications"),
        Word(word: "Bit", partOfSpeech: "noun", definition: "an abbreviation for “binary digit,” the smallest piece of information used by a computer"),
        Word(word: "Conditional statements", partOfSpeech: "noun", definition: "another fundamental piece of programming instructions, set the terms for when a program moves forward"),
        Word(word: "Bandwidth", partOfSpeech: "noun", definition: "the amount of information that hard-wired or wireless connections can process or transmit"),
    ]
}

class Word {
    var word: String
    var partOfSpeech: String
    var definition: String
    
    init(word: String, partOfSpeech: String, definition: String) {
        self.word = word
        self.partOfSpeech = partOfSpeech
        self.definition = definition
    }
}
