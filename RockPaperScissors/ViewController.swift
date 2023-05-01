//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Nidhin Nishanth on 4/29/23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var opponentLabel: UILabel!
    
    @IBOutlet var gameStatusLabel: UILabel!
    
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!

    @IBOutlet var playAgainButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(state: .start)
    }

    @IBAction func rockMove(_ sender: UIButton) {
        playGame(move: .rock)
    }
    
    @IBAction func paperMove(_ sender: UIButton) {
        playGame(move: .paper)
    }
    
    @IBAction func scissorMove(_ sender: UIButton) {
        playGame(move: .scissors)
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        updateUI(state: .start)
    }

    func updateUI(state: GameState) {
        if state == .win {
            gameStatusLabel.text = "You've won!"
            view.backgroundColor = .systemGreen
        } else if state == .lose {
            gameStatusLabel.text = "You lose :("
            view.backgroundColor = .systemRed
        } else if state == .draw {
            gameStatusLabel.text = "It's a tie, play again?"
            view.backgroundColor = .lightGray
        } else {
            gameStatusLabel.text = "Rock, Paper, Scissors?"
            view.backgroundColor = .white
            opponentLabel.text = "🤖"
            
            playAgainButton.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        }
    }
    
    func playGame(move: Sign) {
        let opponentMove = randomSign()
        let state = move.makeMove(opponentSign: opponentMove)
        updateUI(state: state)
        
        opponentLabel.text = opponentMove.emoji
    
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
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
        
        playAgainButton.isHidden = false
    }
    

}

