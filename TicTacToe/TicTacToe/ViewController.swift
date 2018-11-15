//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameStateActive = TicTacToeBrain.init(gameStateActive: true)
    var playerX = TicTacToeBrain.PlayerInfo.init(piece: .X, playerTurn: true, personPiece: UIImage.init(named: "X")!)
    var playerTurnCounter = 0
    var playerO = TicTacToeBrain.PlayerInfo.init(piece: .O, playerTurn: true, personPiece: UIImage.init(named: "o")!)
    var playerCount = Int()
    var GameBoard = TicTacToeBrain.GameBoard.init(grid:[[" "," "," "],
        [" "," "," "],
        [" "," "," "]
        ]
       )
    
    
    @IBOutlet var gameButtonCollection: [GameButton]!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
  }
    @IBAction func buttonsBeingClicked(_ sender: GameButton) {
        setsPlayerChoice(sender: sender)
        sender.isEnabled = false
        checksRowsForWinner(gameBoard: GameBoard.grid, button: sender)
        }
    
    func setsPlayerChoice(sender:GameButton){
       checksWhichPlayersTurn(turnCounter:playerTurnCounter )
        playerTurnCounter += 1
      
        if playerX.playerTurn {
            sender.setImage(playerX.personPiece, for: .normal)
            playerTurnLabel.text = "Player Turn: O"
            GameBoard.grid[sender.row][sender.col] = playerX.piece.rawValue
            
        } else {
            sender.setImage(playerO.personPiece, for: .normal)
            playerTurnLabel.text = "Player Turn: X"
            GameBoard.grid[sender.row][sender.col] = playerO.piece.rawValue
            

        }
    }
    func checksWhichPlayersTurn(turnCounter: Int){
        if turnCounter % 2 == 0{
            playerX.playerTurn = true
        }else{
           playerX.playerTurn = false
        }
    }
    func checksRowsForWinner(gameBoard:[[String]],button:GameButton)  {
        for num1 in 0...button.row {
            for num2 in stride(from: button.col, to: 0, by: 1){
                print(gameBoard[num1][num2])
                    }
                }
            }
        }



