//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Nidhin Nishanth on 4/29/23.
//

import UIKit

class ViewController: UIViewController {
   
    // we create some outlets for our labels and buttons
    @IBOutlet var opponentLabel: UILabel!
    @IBOutlet var gameStatusLabel: UILabel!
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!

    @IBOutlet var playAgainButton: UIButton!
    
    // when the app first loads, we want to start a new game
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(state: .start)
    }

    // these actions will call the function playGame() with the appropriate move
    @IBAction func rockMove(_ sender: UIButton) {
        playGame(move: .rock)
    }
    
    @IBAction func paperMove(_ sender: UIButton) {
        playGame(move: .paper)
    }
    
    @IBAction func scissorMove(_ sender: UIButton) {
        playGame(move: .scissors)
    }
    
    // this is for our playAgainButton: when we want to start a new game, we'll update the UI
    @IBAction func startGame(_ sender: UIButton) {
        updateUI(state: .start)
    }
    
    // depending on the state of the game, we will change the gameStatusLabel and backgroundColor of the view to let the player know their outcome
    func updateUI(state: GameState) {
        if state == .win {
            gameStatusLabel.text = "You've won!"
            view.backgroundColor = .systemGreen
        }
        else if state == .lose {
            gameStatusLabel.text = "You lose :("
            view.backgroundColor = .systemRed
        }
        else if state == .draw {
            gameStatusLabel.text = "It's a tie, play again?"
            view.backgroundColor = .lightGray
        }
        else {  // this will be for the .start state, we will set up the screen to start the game
            gameStatusLabel.text = "Rock, Paper, Scissors?"
            view.backgroundColor = .white
            opponentLabel.text = "🤖"
            
            // when we set up the game, we want to hide the playAgainButton and activate the rock, paper, scissors buttons
            playAgainButton.isHidden = true
            
            // we will activate and display the buttons for the moves
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        }
    }
    
    // this function will simulate a round of rock paper scissors. We'll pass in the move that we made, and only display that move.
    func playGame(move: Sign) {
        
        // our opponent will make a move (by generating a random sign), and we'll check is not working
        let opponentMove = randomSign()
        let outcome = move.makeMove(opponentSign: opponentMove)
        updateUI(state: outcome)
        
        // we'll change the opponent's label to know what move they made
        opponentLabel.text = opponentMove.emoji
    
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        // we'll check which of the moves we've selected, and hide the other choices
        switch move {
        case .rock:
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        // we'll show the playAgainButton so the user can play again
        playAgainButton.isHidden = false
    }
    

}

