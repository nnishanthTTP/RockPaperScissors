//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Nidhin Nishanth on 4/29/23.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else { // else if sign == 2
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func makeMove(opponentSign: Sign) -> GameState {
        
        if self == opponentSign {
            return .draw
        }
        else if self == .paper && opponentSign == .rock {
            return .win
        } else if self == .rock && opponentSign == .scissors {
            return .win
        } else if self == .scissors && opponentSign == .paper {
            return .win
        } else {
            return .lose
        }
        
    }
}
