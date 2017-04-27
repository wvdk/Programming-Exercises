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
        if gameManager.gameState.playerForCurrentTurn() == gameManager.humanPlayer {
            
            let location = sender.tag // We tagged each tile button in IB with it's proper location index number.
            
            gameManager.takeUserMoveTo(location: location)
            
//            if gameManager.humanPlayer == .X {
//                makeMoveWith(tile: .X, atLocation: sender.tag)
//            } else if gameManager.humanPlayer == .O {
//                makeMoveWith(tile: .O, atLocation: sender.tag)
//            }
        } else {
            print("Tile was tapped, but it's not the users turn so we will just ignore it.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup initial state of game.
        gameManager.gameState = GameState(boardLayout: BoardLayout(), playerX: Player.X, playerO: Player.O)
        gameManager.humanPlayer = Player.X
        gameManager.computerPlayer = Player.O
        
        self.computerThinkingActivityIndicator.isHidden = true
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TicTacToeViewController.computerIsDoneThinking), name: "doneThinking", object: nil)
    }

}
