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

class GameManager {
    var gameState: GameState!
    var computerPlayer: Player!
    var humanPlayer: Player!
    
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
    
    func takeUserMove(move: Move) throws {
        guard gameState.isValidMove(move: move) else {
            throw FailedToMakeMove.NotAValidMove
        }
        
        guard gameState.theEnd() == false else {
            throw FailedToMakeMove.GameIsOver
        }
        
        self.gameState = self.gameState.newGameStateAfter(move: move)
        
        print("Move: \(move)")
    }
    
    func computerMakeMove() throws {
        guard gameState.theEnd() == false else {
            throw FailedToMakeMove.GameIsOver
        }
        
        if let newScoreMovePair = self.findBestMoveIn(gameState: self.gameState) {
            let newMove = newScoreMovePair.move
            
            self.gameState = gameState.newGameStateAfter(move: newMove)
        
//            NotificationCenter.default.post(name: "doneThinking" as NSNotification.Name, object: nil)
        } else {
            print("could not find a move to make")
        }
    }
    
    private func findBestMoveIn(gameState: GameState) -> (move: Move, score: Int)? {
        var listOfScoreMovePairs: [(Int, Move)] = []
        
        if let allPossibleMoves = gameState.allPossibleFutureMoves() {
            for move in allPossibleMoves {
                let score = self.getScoreFor(move: move)
                
                listOfScoreMovePairs.append((score, move))
            }
        }
        
        if listOfScoreMovePairs.count > 0 {
            var bestMoveFound: Move?
            var maxScoreFound = 0
            for scoreMovePair in listOfScoreMovePairs {
                if scoreMovePair.0 > maxScoreFound {
                    maxScoreFound = scoreMovePair.0
                    bestMoveFound = scoreMovePair.1
                }
            }
            
            return (bestMoveFound!, maxScoreFound)
        } else {
            return nil
        }
    }
    
    private func getScoreFor(move: Move) -> Int {
        if gameState.isValidMove(move: move) {
            let possibleGameState = self.gameState.newGameStateAfter(move: move)
            
            if possibleGameState.theEnd() {
                
                if possibleGameState.isDraw() {
                    return 0
                }
                
                if possibleGameState.playerOwins() {
                    if  possibleGameState.playerO == self.computerPlayer {
                        return 10
                    } else {
                        return -10
                    }
                }
                
                if possibleGameState.playerXwins() {
                    if  possibleGameState.playerX == self.computerPlayer {
                        return 10
                    } else {
                        return -10
                    }
                }
            } else {
                return findBestMoveIn(gameState: possibleGameState)!.score
            }
        }
        
        return -999
    }
}
