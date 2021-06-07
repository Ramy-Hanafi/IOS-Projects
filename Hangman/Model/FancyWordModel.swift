//
//  FancyWordModel.swift
//  BCS422MidtermStarter
//
//  Created by David Gerstl on 3/19/21.
//

// We need UIKit for UIImage
import UIKit



// class to load the words in a dictionary as a data
// source for a table on iOS
class FancyWordModel {
    
    // Students: Hint--read the method comments,
    // definitions, and the test code
    // don't waste your time reading the code
    // of these methods as they rely on some
    // functional programming and on some
    // UNIX knowlege.
    
    // MARK: - Public access functions
 
    // given a length, returns the number of words of a specific length
    func getCountOfWordsOf(length: Int)->Int {
        return lcWords.filter { $0.lengthOfBytes(using: String.Encoding.utf8)==length}.count
    }
    func getNthWordOf(length: Int, n: Int)->String? {
        let theWords = lcWords.filter { $0.lengthOfBytes(using: String.Encoding.utf8)==length}
        return (n >= theWords.count) ? nil: theWords[n]
    }
    
    // MARK: Background Section
    
    // list of words, all lower case.
    fileprivate var lcWords = Array<String>()
    
    
    let dictionaryFile = "/usr/share/dict/words"
    
    // This loads the standard UNIX dictionary into the words array, making all the words lower case and of length "length"
    init(){
        let minDesiredLength = 4
        let maxDesiredLength = 7
        // Location of Standard UNIX dictionary file
        var rawDictionary = String()
        do {
            try rawDictionary = String(contentsOfFile: dictionaryFile, encoding: String.Encoding.utf8)
            // now parse this into a string array and put into words
            // while converting to lower case (with an anonymous closure)
            // Since the full list is too long. We'll keep only words of length length
            
            // Making this a Set removes duplicates for us
            let lcWordsSetBig = Set((rawDictionary.components(separatedBy: "\n").map { $0.lowercased() }).filter { $0.lengthOfBytes(using: String.Encoding.utf8)<=maxDesiredLength && $0.lengthOfBytes(using: String.Encoding.utf8)>=minDesiredLength})
            // pick desiredCount random elements
            // and put into sorted array
            lcWords = lcWordsSetBig.shuffled().sorted()
        } catch {
            // I really should do more here--this may be a fatal error
            // probably a failible init() and exception class is called for
            print("Oh no--error reading dictionary file")
        }
    } // init()
    
    
} // Class WordsAbbreviated

