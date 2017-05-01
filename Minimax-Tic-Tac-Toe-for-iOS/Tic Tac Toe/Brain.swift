//
//  Brain.swift
//  Tic Tac Toe
//
//  Created by Wesley Van der Klomp on 4/26/17.
//  Copyright © 2017 wvdk. All rights reserved.
//

import Foundation

struct Brain {
    
    private let everyWinPattern = [
        [0, 4, 8], [2, 4, 6], // Diagonal three in a row
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
        [0, 3, 6], [1, 4, 7], [2, 5, 8] // Vertical
    ]
    
    func scoreFor(gameState: String) -> Int {
        return 999
    }
    
    func minimax(gameState: String) {
        // if game is over {
        //    retrun scoreFor(game)
        // }
        
        var scores: [Int] = []
        var moves: [Int] = []
        
        for move in game.availableMoves {
            
        }
        
    }
    
    func checkForWin(boardLayout: BoardLayout) -> Player? {
        return nil
    }
    
    func allPossibleMoviesFor(player: Player, on board:BoardLayout) -> [Location] {
        return []
    }
    
    // Recursive
    // Returns score
    // specific to player
    // for a single move
    
    func findBestMoveIn(boardLayout: BoardLayout, forPlayer: Player) -> Location? {
        
        // First things first, what are the available moves.
        // And if there are zero, return nil.
        
        
        
//        var listOfScoreMovePairs: [(Int, Move)] = []
//        
//        if let allPossibleMoves = gameState.allPossibleFutureMoves() {
//            for move in allPossibleMoves {
//                let score = self.getScoreFor(move: move)
//                
//                listOfScoreMovePairs.append((score, move))
//            }
//        }
//        
//        if listOfScoreMovePairs.count > 0 {
//            var bestMoveFound: Move?
//            var maxScoreFound = 0
//            for scoreMovePair in listOfScoreMovePairs {
//                if scoreMovePair.0 > maxScoreFound {
//                    maxScoreFound = scoreMovePair.0
//                    bestMoveFound = scoreMovePair.1
//                }
//            }
//            
//            return (bestMoveFound!, maxScoreFound)
//        } else {
//            return nil
//        }
        
        return nil
    }
    
    
//    private func qualityOf(move: Move, forGameState gameState: GameState) -> Int {
//        if gameState.isValidMove(move: move) {
//            let possibleGameState = gameState.newGameStateAfter(move: move)
//            
//            if possibleGameState.theEnd() {
//                
//                if possibleGameState.isDraw() {
//                    return 0
//                }
//                
//                if possibleGameState.playerOwins() {
//                    if  possibleGameState.playerO == self.computerPlayer {
//                        return 10
//                    } else {
//                        return -10
//                    }
//                }
//                
//                if possibleGameState.playerXwins() {
//                    if  possibleGameState.playerX == self.computerPlayer {
//                        return 10
//                    } else {
//                        return -10
//                    }
//                }
//            } else {
//                return findBestMoveIn(gameState: possibleGameState)!.score
//            }
//        }
//        
//        return -999
//    }
    
}
