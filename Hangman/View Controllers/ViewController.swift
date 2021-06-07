//
//  ViewController.swift
//  FinalStarterSpring2021
//
//  Created by David Gerstl on 5/10/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var theGuessButton: UIButton!
    var counter: Int = 0
    var currentImageString: String?
    @IBOutlet weak var theWordLabel: UILabel!
    var theGameImage: UIImage?
    @IBOutlet weak var gameImage: UIImageView!
    var theWordModel = FancyWordModel()
    var theRandomModel = RandomNumber()
    @IBOutlet weak var theTextField: UITextField!
    var theWord: String?
    var theScore: Int = 0
    var letterEntered: Character?
    @IBAction func enteredLetter(_ sender: Any) {
    }
    @IBAction func guessPressed(_ sender: Any) {
        var entered = theTextField.text
        var enteredLetter = entered!.index(entered!.startIndex, offsetBy: 0)
        let theLetter = entered![enteredLetter]
        checkGuessedLetter(theLetter: theLetter)
        theTextField.text = ""
        
    }
    @IBAction func playAgainPressed(_ sender: Any) {
        gameImage.image = UIImage(named: "Hangman0")
        counter = 0
        theScore = 0
        let wordLength = theWord!.count
        let random = theRandomModel.returnRandomNumber(upperBound: wordLength)
        theWord = theWordModel.getNthWordOf(length: wordLength, n: random)
        theWordLabel.text = theWord
        scoreLabel.text = "Score: \(theScore)"
        theTextField.text = ""
        theTextField.isUserInteractionEnabled = true
        theGuessButton.isUserInteractionEnabled = true
        theWordLabel.isHidden = true
        theTextField.placeholder = "Guess the letter"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameImage.image = theGameImage
        theWordLabel.text = theWord
        theWordLabel.isHidden = true
        // some demo code for play
        let fourLetterCount = theWordModel.getCountOfWordsOf(length: 4)
        var randomNumber = theRandomModel.returnRandomNumber(upperBound: fourLetterCount)
        let randomFourLetterWord = theWordModel.getNthWordOf(length: 4, n: randomNumber)!
        print("There are \(fourLetterCount) 4 letter words")
        print("A random one is: \(randomFourLetterWord)")
        let sevenLetterCount = theWordModel.getCountOfWordsOf(length: 7)
        randomNumber = theRandomModel.returnRandomNumber(upperBound: sevenLetterCount)
        let randomSevenLetterWord = theWordModel.getNthWordOf(length: 7, n: randomNumber)!
        print("There are \(sevenLetterCount) 7 letter words")
        print("A random one is: \(randomSevenLetterWord)")
    }
    
    func checkGuessedLetter(theLetter: Character){
    let thePrevScore = theScore
        for i in theWord!.indices[theWord!.startIndex..<theWord!.endIndex] {
            if theWord![i] == theLetter{
                theScore += 1
                scoreLabel.text = "Score: \(theScore)"
                if theScore == theWord?.count{
                    theWordLabel.isHidden = false
                    theWordLabel.text = "Congratulations you won!"
                    theTextField.placeholder = "It was \(theWord!)"
                    theTextField.isUserInteractionEnabled = false
                    theGuessButton.isUserInteractionEnabled = false
                }
            }
        }
        let newScore = theScore
        if thePrevScore == newScore{
            counter += 1
            if counter == 6 {
                theWordLabel.isHidden = false
                theWordLabel.text = "Sorry you lost."
                theTextField.placeholder = "It was \(theWord!)"
                theTextField.isUserInteractionEnabled = false
                theGuessButton.isUserInteractionEnabled = false
            }
            currentImageString = "Hangman\(counter)"
            theGameImage = UIImage(named: currentImageString!)
            gameImage.image = theGameImage
        }else{
            return
        }
    }

}

