////
////  GameState.swift
////  Tic Tac Toe
////
////  Created by Wes Van der Klomp on 5/5/16.
////  Copyright © 2016 wvdk. All rights reserved.
////
//
//import Foundation
//
//extension GameState: Equatable {}
//
//func ==(lhs: GameState, rhs: GameState) -> Bool {
//    if lhs.boardLayout == rhs.boardLayout && lhs.playerX == rhs.playerX && lhs.playerO == rhs.playerO {
//        return true
//    } else {
//        return false
//    }
//}
//
///// A general repersentation of the state of a tic tac toe game between two players.
//struct GameState {
//    let boardLayout: BoardLayout
//    let playerX: Player
//    let playerO: Player
//    
////    private let indexesOfAllThreeInARowPatterns = [
////        // Horizontal
////        [0, 1, 2],
////        [3, 4, 5],
////        [6, 7, 8],
////        
////        // Vertical
////        [0, 3, 6], // left column
////        [1, 4, 7], // middle column
////        [2, 5, 8], // right column
////        
////        // Diagonal
////        [0, 4, 8],
////        [2, 4, 6]]
//    
//    func playerForCurrentTurn() -> Player {
//        var playerXTileCount = 0
//        var playerOTileCount = 0
//        
//        for tile in boardLayout.tiles {
//            if tile == Tile.O {
//                playerOTileCount += 1
//            } else if tile == Tile.X {
//                playerXTileCount += 1
//            }
//        }
//        
//        if playerOTileCount == 0 && playerXTileCount == 0 {
//            return playerX
//        } else if playerOTileCount > playerXTileCount {
//            return playerX
//        } else {
//            return playerO
//        }
//    }
//    
//    func isValidMove(move: Move) -> Bool {
//        if boardLayout.tiles[move.location] == Tile.Blank && move.player == self.playerForCurrentTurn() {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//    func allPossibleFutureMoves() -> [Move]? {
//        return allPossibleMovesForMoves(moves: allPossibleMovesForThisTurn())
//    }
//    
//    func allPossibleMovesForThisTurn() -> [Move]? {
//        var moves: [Move] = []
//        
//        for location in 0..<self.boardLayout.tiles.count {
//            
//            let tile = self.boardLayout.tiles[location]
//            
//            if tile == .Blank {
//                var playerForNextTurn = Player.X
//
//                if self.playerForCurrentTurn() == .X {
//                    playerForNextTurn = .O
//                }
//                
//                let newMove = Move(player: playerForNextTurn, location: location)
//                
//                moves.append(newMove)
//            }
//            
//        }
//        
//        if moves.isEmpty == true {
//            return nil
//        } else {
//            return moves
//        }
//    }
//    
//    func allPossibleMovesForMoves(moves: [Move]?) -> [Move]? {
//        if moves != nil {
//            var movesCollected: [Move] = []
//            
//            if let allMoves = allPossibleMovesForMoves(moves: moves) {
//                for move in allMoves {
//                    if isValidMove(move: move) {
//                        if let newMoves = allPossibleMovesForMoves(moves: allMoves) {
//                            movesCollected += newMoves
//                        }
//                    }
//                }
//            }
//            
//            if movesCollected.isEmpty == true {
//                return nil
//            } else {
//                return movesCollected
//            }
//        } else {
//            return nil
//        }
//    }
//    
//    func newGameStateAfter(move: Move) -> GameState {
//        var newBoardLayout = self.boardLayout
//        
//        if move.player == Player.X {
//            newBoardLayout.tiles[move.location] = Tile.X
//        } else if move.player == Player.O {
//            newBoardLayout.tiles[move.location] = Tile.O
//        }
//        
//        return GameState(boardLayout: newBoardLayout, playerX: playerX, playerO: playerO)
//    }
//    
//    func theEnd() -> Bool {
//        if isDraw() || playerOwins() || playerXwins() {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//    func isDraw() -> Bool {
//        func boardFull() -> Bool {
//            var countOfEmptyTiles = 0
//            for tile in boardLayout.tiles {
//                if tile == Tile.Blank {
//                    countOfEmptyTiles += 1
//                }
//            }
//            
//            if countOfEmptyTiles > 0 {
//                return false
//            } else {
//                return true
//            }
//        }
//        
//        if boardFull() && !playerXwins() && !playerOwins() {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//    func playerXwins() -> Bool {
//        var foundAThreeInARow = false
//        
//        for threeInARow in indexesOfAllThreeInARowPatterns {
//            
//            var tilesThatBelongsToThisPlayerInThisRow = 0
//            
//            for index in threeInARow {
//                if boardLayout.tiles[index] == Tile.X {
//                    tilesThatBelongsToThisPlayerInThisRow += 1
//                }
//            }
//            
//            
//            if tilesThatBelongsToThisPlayerInThisRow == 3 {
//                foundAThreeInARow = true
//            }
//        }
//        
//        return foundAThreeInARow
//    }
//    
//    func playerOwins() -> Bool {
//        var foundAThreeInARow = false
//        
//        for threeInARow in indexesOfAllThreeInARowPatterns {
//            
//            var tilesThatBelongsToThisPlayerInThisRow = 0
//
//            for index in threeInARow {
//                if boardLayout.tiles[index] == Tile.O {
//                    tilesThatBelongsToThisPlayerInThisRow += 1
//                }
//            }
//            
//            
//            if tilesThatBelongsToThisPlayerInThisRow == 3 {
//                foundAThreeInARow = true
//            }
//        }
//        
//        return foundAThreeInARow
//    }
//
//}
