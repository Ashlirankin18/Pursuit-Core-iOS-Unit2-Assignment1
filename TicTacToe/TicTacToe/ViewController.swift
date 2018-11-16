//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   //Properties
    var gameStateActive = TicTacToeBrain.init(gameStateActive: true)
    var playerX = TicTacToeBrain.PlayerInfo.init(piece: .X, playerTurn: true, personPiece: UIImage.init(named: "X")!, timesWon: 0)
    var playerTurnCounter = 0
    var playerO = TicTacToeBrain.PlayerInfo.init(piece: .O, playerTurn: true, personPiece: UIImage.init(named: "o")!, timesWon: 0)
    var playerCount = Int()
    var GameBoard = TicTacToeBrain.GameBoard.init(grid:[[" "," "," "],
        [" "," "," "],
        [" "," "," "]
        ])
    var intMatrix = [[100,100,100],
                    [100,100,100],
                    [100,100,100],]
    
    @IBOutlet var gameButtonCollection: [GameButton]!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var playerOneWins: UILabel!
    @IBOutlet weak var playerTwoWins: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        playerOneWins.text = "Times \(playerX.piece.rawValue) : \(playerX.timesWon)"
        playerTwoWins.text = "Times Won \(playerO.piece.rawValue) : \(playerO.timesWon)"
  }
    //Methods:
    
    @IBAction func buttonsBeingClicked(_ sender: GameButton) {
        setsPlayerChoice(sender: sender)
        checksForWinningConditions(intGameBoard: intMatrix, buttons: [sender], label: playerTurnLabel)
        
        }
    func checksWhichPlayersTurn(turnCounter: Int){
        if turnCounter % 2 == 0{
            playerX.playerTurn = true
        }else{
            playerX.playerTurn = false
        }
    }
    
    func setsPlayerChoice(sender:GameButton){
       checksWhichPlayersTurn(turnCounter:playerTurnCounter )
        playerTurnCounter += 1
      
        if playerX.playerTurn {
            sender.setImage(playerX.personPiece, for: .normal)
            playerTurnLabel.text = "Player Turn: O"
            GameBoard.grid[sender.row][sender.col] = playerX.piece.rawValue
            intMatrix[sender.row][sender.col] = 1
         
        } else {
            sender.setImage(playerO.personPiece, for: .normal)
            playerTurnLabel.text = "Player Turn: X"
            GameBoard.grid[sender.row][sender.col] = playerO.piece.rawValue
           intMatrix[sender.row][sender.col] = 0
        }
       print(intMatrix)
    }
    
    func checksForWinningConditions(intGameBoard:[[Int]],buttons:[GameButton],label:UILabel) {
        var xCounter = 0
        var oCounter = 1
        for rows in 0..<intGameBoard[0].count {
            for _ in 0..<intGameBoard.count {
                let sum = intGameBoard[rows].reduce(0){$0 + $1}
                if sum == 3 {
                     playerX.timesWon += 1
                    label.text = "\(playerX.piece.rawValue) WINS!"
                    playerOneWins.text = "Times Won \(playerX.piece.rawValue) : \(playerX.timesWon)"

                }
                else if sum == 0 {
                     playerO.timesWon += 1
                    label.text = "\(playerO.piece.rawValue) WINS!"
                    playerTwoWins.text = "Times Won \(playerO.piece.rawValue) : \(playerO.timesWon)"

                }
                else if sum == 101 || sum == 201 {
                    xCounter += 1
                
                }
                else if sum == 2 || sum == 101 || sum == 200 {
                    oCounter += 1
                
                }
                break
                     }
            
        }
        print("this is xCounter: \(xCounter)")
        print("this is oCounter: \(oCounter)")
    if xCounter == 3 {
        label.text = "\(playerX.piece.rawValue) WINS!"
        gameButtonCollection.forEach{$0.isUserInteractionEnabled = false}
        playerX.timesWon += 1
        playerOneWins.text = "Times Won \(playerX.piece.rawValue) : \(playerX.timesWon)"
       
    }
    else if oCounter == 3 {
         playerO.timesWon += 1
         label.text = "\(playerO.piece.rawValue) WINS!"
        gameButtonCollection.forEach{$0.isUserInteractionEnabled = false}
        playerTwoWins.text = "Times Won \(playerO.piece.rawValue) : \(playerO.timesWon)"
  
        }
    
    }
    @IBAction func playAgain(_ sender: UIButton) {
        playerTurnCounter = 0
        gameButtonCollection.forEach{$0.isUserInteractionEnabled = true}
        gameButtonCollection.forEach{$0.setImage(nil, for: .normal)}
        intMatrix = [[100,100,100],
                     [100,100,100],
                     [100,100,100],]
        GameBoard = TicTacToeBrain.GameBoard.init(grid:[[" "," "," "],
                                                        [" "," "," "],
                                                        [" "," "," "]
            ])
        playerTurnLabel.text = "Player X Turn"
    }
    
}
