//
//  TicTacToeViewController.swift
//  Tic Tac Toe
//
//  Created by Wes Van der Klomp on 5/1/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    let gameManager = GameManager()
    
    @IBOutlet weak var playingAsLabel: UILabel!
    @IBOutlet weak var computerThinkingActivityIndicator: UIActivityIndicatorView!

    @IBAction func tileTapped(sender: UIButton) {
        func makeMoveWith(tile: Tile, atLocation: Int) {
            let move = Move(player: gameManager.humanPlayer, location: atLocation)
            
            do {
                try gameManager.takeUserMove(move: move)
                
                if gameManager.humanPlayer == .X {
                    sender.setImage(UIImage(named: "X"), for: UIControlState.focused)
                } else if gameManager.humanPlayer == .O {
                    sender.setImage(UIImage(named: "O"), for: UIControlState.focused)
                }
                
                self.computerThinkingActivityIndicator.startAnimating()
                self.computerThinkingActivityIndicator.isHidden = false
                
                DispatchQueue.global().async(execute: {
                    do {
                        try self.gameManager.computerMakeMove()
                    } catch {
                        print("Could not make a move.")
                    }
                    
                    DispatchQueue.main.async(execute: {
                        self.computerThinkingActivityIndicator.stopAnimating()
                        self.computerThinkingActivityIndicator.isHidden = true
                    })
                })

            } catch FailedToMakeMove.NotAValidMove {
                // Lets do nothing. User should already know why nothing happens when they tap a tile that's already been played.
                print("Invalid move selected. Doing nothing.")
            } catch FailedToMakeMove.GameIsOver {
                print("Can't make a move, the game is over.")
            } catch {
                print("Unknown error.")
            }
        }
        
        if gameManager.gameState.playerForCurrentTurn() == gameManager.humanPlayer {
            if gameManager.humanPlayer == .X {
                makeMoveWith(tile: .X, atLocation: sender.tag)
            } else if gameManager.humanPlayer == .O {
                makeMoveWith(tile: .O, atLocation: sender.tag)
            }
        } else {
            print("Tile was tapped, but it's not the users turn.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newGameState = GameState(boardLayout: BoardLayout(), playerX: Player.X, playerO: Player.O)
        
        gameManager.gameState = newGameState
        gameManager.humanPlayer = Player.X
        gameManager.computerPlayer = Player.O
        
        self.computerThinkingActivityIndicator.isHidden = true
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TicTacToeViewController.computerIsDoneThinking), name: "doneThinking", object: nil)
    }

}
