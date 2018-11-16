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
    var playerX = TicTacToeBrain.PlayerInfo.init(piece: .X, playerTurn: true, personPiece: UIImage.init(named: "X")!)
    var playerTurnCounter = 0
    var playerO = TicTacToeBrain.PlayerInfo.init(piece: .O, playerTurn: true, personPiece: UIImage.init(named: "o")!)
    var playerCount = Int()
    var GameBoard = TicTacToeBrain.GameBoard.init(grid:[[" "," "," "],
        [" "," "," "],
        [" "," "," "]
        ])
    var colArray = [Int]()
    var rowArray = [Int]()
    var diagonialArray = [Int]()
    var sum = Int()
    var diagonialArray2 = [Int]()
    @IBOutlet var gameButtonCollection: [GameButton]!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        colArray = [100,100,100]
        rowArray = [100,100,100]
        diagonialArray = [100,100,100]
        diagonialArray2 = [100,100,100]
  }
    //Methods:
    
    @IBAction func buttonsBeingClicked(_ sender: GameButton) {
        setsPlayerChoice(sender: sender)
        sender.isEnabled = false
       checksForRowsAndCols(gameBoard: GameBoard.grid, button: sender)
        checksForDiagonals1(gameBoard: GameBoard.grid, label: playerTurnLabel, buttons: sender)
        checksForDiagonals2(gameBoard: GameBoard.grid, label: playerTurnLabel, buttons: sender)
       checksWinner(arrayInt: rowArray, label: playerTurnLabel)
       checksWinner(arrayInt: colArray, label: playerTurnLabel)
        checksWinner(arrayInt: diagonialArray, label: playerTurnLabel)
      checksWinner(arrayInt: diagonialArray2, label: playerTurnLabel)
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
            
        } else {
            sender.setImage(playerO.personPiece, for: .normal)
            playerTurnLabel.text = "Player Turn: X"
            GameBoard.grid[sender.row][sender.col] = playerO.piece.rawValue
            
        }
    }
    
    func checksForRowsAndCols(gameBoard:[[String]],button:GameButton) {
        for num in 0...button.row {
            for num1 in 0...button.col {
        if gameBoard[num][num1] == playerX.piece.rawValue  {
            colArray[num] = 1
            rowArray[num1] = 1
        }
        else {
            colArray[num] = 0
            rowArray[num1] = 0
                }
    }
    }
    }
    
    func checksForDiagonals1(gameBoard:[[String]],label:UILabel,buttons:GameButton){
        for num in 0...buttons.row{
            for _ in 0...buttons.col{
                if gameBoard[num][num] == playerX.piece.rawValue {
                    diagonialArray[num] = 1
                     print("diagonialArray: \(diagonialArray)")
                }
                else {
                    diagonialArray[num] = 0
                    print("diagonialArray: \(diagonialArray)")
                }
            }
        }
    }
            func checksForDiagonals2(gameBoard:[[String]],label:UILabel,buttons:GameButton){
                for num in 0...buttons.row{
                    for num1 in stride(from: buttons.col, to: 0, by: -1){
                        if gameBoard[num][num1] == playerX.piece.rawValue {
                            diagonialArray2[num] = 1
                            print("diagonialArray2: \(diagonialArray2)")
                        }
                        else {
                            diagonialArray2[num] = 0
                            print("diagonialArray2: \(diagonialArray2)")
                        }
                    }
                }
            }
    func checksWinner(arrayInt:[Int],label:UILabel){
        sum = arrayInt.reduce(0){$0 + $1}
        if sum == 3  {
            label.text = "Player One Wins!"
        } else if sum == 0 {
             label.text = "Player Two Wins!"
        }
    }
            
    @IBAction func playAgainButton(_ sender: UIButton) {
    gameButtonCollection.forEach{$0.isUserInteractionEnabled = true}
        gameButtonCollection.forEach{$0.isEnabled = true}
        gameButtonCollection.forEach{$0.setImage( nil, for: .normal)}
        playerTurnCounter = 0
        playerTurnLabel.text = "Player's Turn:"
        
    }
   
}


