//
//  ViewController.swift
//  Apple PiE
//
//  Created by Joyer on 12/7/25.
//

//
//  ViewController.swift
//  Apple PiE
//
//  Created by Joyer on 12/7/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    // MARK: - Game Properties
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    //  Stretch goal: scoring
    var totalPoints = 0
    
    var currentGame: Game!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // MARK: - Game Setup
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(
                word: newWord,
                incorrectMovesRemaining: incorrectMovesAllowed,
                guessedLetters: []
            )
            enableLetterButtons(true)
            updateUI()
        } else {
            // No more words – disable all buttons
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    // MARK: - UI Updates
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses), Points: \(totalPoints)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    // MARK: - Game State
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            // Player lost
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            // Player won the round
            totalPoints += 100         //  bonus for completing the word
            totalWins += 1
        } else {
            // Game still going
            updateUI()
        }
    }
    
    // MARK: - Scoring (Stretch Goal)
    func addPointsFor(letter: Character) {
        if currentGame.word.contains(letter) {
            var matches = 0
            for char in currentGame.word {
                if char == letter {
                    matches += 1
                }
            }
            // 10 points per occurrence of the correct letter
            totalPoints += matches * 10
        }
    }
    
    // MARK: - Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.title(for: .normal)!   // use the button title
        let letter = Character(letterString.lowercased())
        
        currentGame.playerGuessed(letter: letter)
        addPointsFor(letter: letter)     //  scoring
        updateGameState()
    }
}
