////
////  GameStateTests.swift
////  Tic Tac ToeTests
////
////  Created by Wes Van der Klomp on 5/18/16.
////  Copyright © 2016 wvdk. All rights reserved.
////
//
//import XCTest
//@testable import Tic_Tac_Toe
//
//class GameStateTests: XCTestCase {
//    
//    // MARK: - playerForCurrentTurn()
//
//    func testPlayerForCurrentTurnWithMoreOs() {
//        var tiles: [Tile] = []
//        
//        for i in 0...8 {
//            if i < 3 {
//                tiles.append(Tile.O)
//            } else {
//                tiles.append(Tile.Blank)
//            }
//        }
//        
//        var layoutWithLotsOfOs = BoardLayout()
//        layoutWithLotsOfOs.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: layoutWithLotsOfOs, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.playerForCurrentTurn() == Player.X)
//    }
//    
//    func testPlayerForCurrentTurnWithMoreXs() {
//        var tiles: [Tile] = []
//        
//        for i in 0...8 {
//            if i < 3 {
//                tiles.append(Tile.X)
//            } else {
//                tiles.append(Tile.Blank)
//            }
//        }
//        
//        var layoutWithLotsOfOs = BoardLayout()
//        layoutWithLotsOfOs.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: layoutWithLotsOfOs, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.playerForCurrentTurn() == Player.O)
//    }
//    
//    // MARK: - isValidMove()
//    
//    func testIsValidMove() {
//        var tiles: [Tile] = []
//        
//        for i in 0...8 {
//            if i < 3 {
//                tiles.append(Tile.O)
//            } else {
//                tiles.append(Tile.Blank)
//            }
//        }
//        
//        var layoutWithLotsOfOs = BoardLayout()
//        layoutWithLotsOfOs.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: layoutWithLotsOfOs, playerX: Player.X, playerO: Player.O)
//        
//        let myMove = Move(player: Player.X, location: 6)
//        
//        XCTAssert(myGameState.isValidMove(move: myMove) == true)
//    }
//    
//    func testIsNotValidMove() {
//        var tiles: [Tile] = []
//        
//        for i in 0...8 {
//            if i < 3 {
//                tiles.append(Tile.O)
//            } else {
//                tiles.append(Tile.Blank)
//            }
//        }
//        
//        var layoutWithLotsOfOs = BoardLayout()
//        layoutWithLotsOfOs.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: layoutWithLotsOfOs, playerX: Player.X, playerO: Player.O)
//        
//        let myMove = Move(player: Player.X, location: 2)
//        
//        XCTAssert(myGameState.isValidMove(move: myMove) == false)
//    }
//    
//    // MARK: - isDraw()
//    
//    func testIsNotDrawWhenOHasThreeInARow() {
//        var tiles: [Tile] = []
//        
//        for i in 0...8 {
//            if i < 3 {
//                tiles.append(Tile.O)
//            } else {
//                tiles.append(Tile.Blank)
//            }
//        }
//        
//        var layoutWithLotsOfOs = BoardLayout()
//        layoutWithLotsOfOs.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: layoutWithLotsOfOs, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.isDraw() == false)
//    }
//    
//    func testIsNotDrawWhenXHasThreeInARow() {
//        var tiles: [Tile] = []
//        
//        for i in 0...8 {
//            if i < 3 {
//                tiles.append(Tile.X)
//            } else {
//                tiles.append(Tile.Blank)
//            }
//        }
//        
//        var layoutWithLotsOfXs = BoardLayout()
//        layoutWithLotsOfXs.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: layoutWithLotsOfXs, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.isDraw() == false)
//    }
//    
//    func testIsNotDrawWhenEmpty() {
//        let emptyBoard = BoardLayout() // should init with an empty boardLayout
//        
//        let myGameState = GameState(boardLayout: emptyBoard, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.isDraw() == false)
//    }
//    
//    func testIsDrawWhenBoardIsFullButNoThreeInARow() {
//        let tiles: [Tile] = [.X, .O, .X,
//                             .O, .O, .X,
//                             .X, .X, .O]
//        
//        var fullHouse = BoardLayout()
//        fullHouse.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: fullHouse, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.isDraw() == true)
//    }
//    
//    // MARK: - playerXwins()
//    
//    func testPlayerXwins() {
//        let tiles: [Tile] = [.X, .Blank, .Blank,
//                             .Blank, .X, .Blank,
//                             .O, .O, .X,]
//        
//        var fullHouse = BoardLayout()
//        fullHouse.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: fullHouse, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.playerXwins() == true)
//    }
//    
//    // MARK: - playerOwins()
//    
//    func testPlayerOwins() {
//        let tiles: [Tile] = [.O, .O, .O,
//                             .Blank, .X, .X,
//                             .Blank, .X, .Blank,]
//        
//        var fullHouse = BoardLayout()
//        fullHouse.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: fullHouse, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.playerOwins() == true)
//    }
//    
//    // MARK: - theEnd()
//
//    func testTheEndWithAThreeInARow() {
//        let tiles: [Tile] = [.O, .O, .O,
//                             .Blank, .X, .X,
//                             .Blank, .X, .Blank,]
//        
//        var fullHouse = BoardLayout()
//        fullHouse.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: fullHouse, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.theEnd() == true)
//    }
//    
//    func testTheEndWithNotOverGame() {
//        let tiles: [Tile] = [.O, .O, .Blank,
//                             .Blank, .X, .X,
//                             .Blank, .X, .Blank,]
//        
//        var fullHouse = BoardLayout()
//        fullHouse.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: fullHouse, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.theEnd() == false)
//    }
//    
//    func testTheEndWithADraw() {
//        let tiles: [Tile] = [.X, .O, .X,
//                             .O, .O, .X,
//                             .X, .X, .O]
//        
//        var fullHouse = BoardLayout()
//        fullHouse.tiles = tiles
//        
//        let myGameState = GameState(boardLayout: fullHouse, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(myGameState.theEnd() == true)
//    }
//    
//    // MARK: - newGameStateAfter(move:)
//    
//    func testNewGameStateAfter() {
//        let move = Move(player: .X, location: 0)
//
//        let originalGameState = GameState(boardLayout: BoardLayout(), playerX: Player.X, playerO: Player.O)
//        
//        let tilesAfterMove: [Tile] = [.X, .Blank, .Blank,
//                                      .Blank, .Blank, .Blank,
//                                      .Blank, .Blank, .Blank]
//        
//        var boardLayoutAfterFakeMove = BoardLayout()
//        boardLayoutAfterFakeMove.tiles = tilesAfterMove
//        
//        let newGameState = GameState(boardLayout: boardLayoutAfterFakeMove, playerX: Player.X, playerO: Player.O)
//        
//        XCTAssert(originalGameState.newGameStateAfter(move: move) == newGameState)
//    }
//    
//    // MARK: - allPossibleMovesForCurrentState()
//    
//    func testAllPossibleMovesForThisTurn() {
//        let tiles: [Tile] = [.X, .O, .X,
//                             .O, .O, .X,
//                             .O, .X, .Blank]
//        
//        var boardLayout = BoardLayout()
//        
//        boardLayout.tiles = tiles
//        
//        let gameState = GameState(boardLayout: boardLayout, playerX: Player.X, playerO: Player.O)
//        
//        let move = Move(player: .X, location: 8)
//        
//        let arrayOfMoves: [Move] = [move]
//        
//        let allPossibleMovesForCurrentState = gameState.allPossibleMovesForThisTurn()!
//
//        XCTAssert(arrayOfMoves == allPossibleMovesForCurrentState)
//    }
//    
//    // MARK: - allPossibleFutureMoves()
//    
//    func testAllPossibleFutureMoves() {
//        let tiles: [Tile] = [.X, .O, .X,
//                             .O, .O, .X,
//                             .O, .X, .Blank]
//        
//        var boardLayout = BoardLayout()
//        
//        boardLayout.tiles = tiles
//        
//        let gameState = GameState(boardLayout: boardLayout, playerX: Player.X, playerO: Player.O)
//        
//        let allPossibleMoves = gameState.allPossibleFutureMoves()!
//        
//        XCTAssert(allPossibleMoves.count == 1)
//    }
//
//
//}
