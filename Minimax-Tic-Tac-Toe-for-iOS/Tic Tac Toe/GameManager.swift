//
//  GameManager.swift
//  Tic Tac Toe
//
//  Created by Wes Van der Klomp on 5/5/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

import Foundation

enum FailedToMakeMove: Error {
    case GameIsOver
    case NotAValidMove
}

struct GameManager {
//    var gameState: GameState
//    var computerPlayer: Player
//    var humanPlayer: Player
//    
//    init(gameState: GameState, computerWillPlayAs: Player) {
//        self.gameState = gameState
//        computerPlayer = computerWillPlayAs
//        
//        if computerWillPlayAs == .O {
//            humanPlayer = .X
//        } else {
//            humanPlayer = .O
//        }
//    }
    
    //        func makeMoveWith(tile: Tile, atLocation: Int) {
    //            let move = Move(player: gameManager.humanPlayer, location: atLocation)
    //
    //            do {
    //                try gameManager.takeUserMove(move: move)
    //
    //                if gameManager.humanPlayer == .X {
    //                    sender.setImage(UIImage(named: "X"), for: UIControlState.focused)
    //                } else if gameManager.humanPlayer == .O {
    //                    sender.setImage(UIImage(named: "O"), for: UIControlState.focused)
    //                }
    //
    //                self.computerThinkingActivityIndicator.startAnimating()
    //                self.computerThinkingActivityIndicator.isHidden = false
    //
    //                DispatchQueue.global().async(execute: {
    //                    do {
    //                        try self.gameManager.computerMakeMove()
    //                    } catch {
    //                        print("Could not make a move.")
    //                    }
    //
    //                    DispatchQueue.main.async(execute: {
    //                        self.computerThinkingActivityIndicator.stopAnimating()
    //                        self.computerThinkingActivityIndicator.isHidden = true
    //                    })
    //                })
    //
    //            } catch FailedToMakeMove.NotAValidMove {
    //                // Lets do nothing. User should already know why nothing happens when they tap a tile that's already been played.
    //                print("Invalid move selected. Doing nothing.")
    //            } catch FailedToMakeMove.GameIsOver {
    //                print("Can't make a move, the game is over.")
    //            } catch {
    //                print("Unknown error.")
    //            }
    //        }
    
//    func takeUserMoveTo(location: Int) throws {
//        
//        let move = Move(player: humanPlayer, location: location)
//        
//        guard gameState.isValidMove(move: move) else {
//            throw FailedToMakeMove.NotAValidMove
//        }
//        
//        guard gameState.theEnd() == false else {
//            throw FailedToMakeMove.GameIsOver
//        }
//        
//        self.gameState = self.gameState.newGameStateAfter(move: move)
//        
//        print("Move: \(move)")
//    }
//    
//    func computerMakeMove() throws {
//        guard gameState.theEnd() == false else {
//            throw FailedToMakeMove.GameIsOver
//        }
//        
//        if let newScoreMovePair = self.findBestMoveIn(gameState: self.gameState) {
//            let newMove = newScoreMovePair.move
//            
//            self.gameState = gameState.newGameStateAfter(move: newMove)
//        
////            NotificationCenter.default.post(name: "doneThinking" as NSNotification.Name, object: nil)
//        } else {
//            print("could not find a move to make")
//        }
//    }
    
    

}
