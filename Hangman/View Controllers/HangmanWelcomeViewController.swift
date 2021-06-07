//
//  HangmanWelcomeViewController.swift
//  FinalStarterSpring2021
//
//  Created by Ramy Hanafi on 5/13/21.
//

import UIKit

class HangmanWelcomeViewController: UIViewController {
    let theWordModel = FancyWordModel()
    var theRandomModel = RandomNumber()
    var randomWord: String?
    

    @IBAction func fourLettersPressed(_ sender: Any) {
        let fourLetterCount = theWordModel.getCountOfWordsOf(length: 4)
        var randomNum = theRandomModel.returnRandomNumber(upperBound: fourLetterCount)
        randomWord = theWordModel.getNthWordOf(length: 4, n: randomNum)
        print("There are \(fourLetterCount) 4 letter words")
    }
    @IBAction func fiveLettersPressed(_ sender: Any) {
        let fiveLetterCount = theWordModel.getCountOfWordsOf(length: 5)
        var randomNum = theRandomModel.returnRandomNumber(upperBound: fiveLetterCount)
        randomWord = theWordModel.getNthWordOf(length: 5, n: randomNum)
        print("There are \(fiveLetterCount) 5 letter words")

    }
    @IBAction func sixLettersPressed(_ sender: Any) {
        let sixLetterCount = theWordModel.getCountOfWordsOf(length: 6)
        var randomNum = theRandomModel.returnRandomNumber(upperBound: sixLetterCount)
        randomWord = theWordModel.getNthWordOf(length: 6, n: randomNum)
        print("There are \(sixLetterCount) 6 letter words")

    }
    @IBAction func sevenLettersPressed(_ sender: Any) {
        let sevenLetterCount = theWordModel.getCountOfWordsOf(length: 7)
        var randomNum = theRandomModel.returnRandomNumber(upperBound: sevenLetterCount)
        randomWord = theWordModel.getNthWordOf(length: 7, n: randomNum)
        print("There are \(sevenLetterCount) 7 letter words")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let theGameVC = segue.destination as? ViewController{
            let theWord = randomWord
            let theImage = UIImage(named: "Hangman0.png")
            theGameVC.theWord = theWord
            theGameVC.theGameImage = theImage
        }
    }
    

}
