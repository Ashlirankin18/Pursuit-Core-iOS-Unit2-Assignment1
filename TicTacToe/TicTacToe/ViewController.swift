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
    var diagonalArray2 = [Int]()
    var sum = Int()
    
    @IBOutlet var gameButtonCollection: [GameButton]!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colArray = [0,0,0]
        rowArray = [0,0,0]
        diagonialArray = [6,7,8]
        diagonalArray2 = [9,10,11]
    }
    //Methods:
    
    @IBAction func buttonsBeingClicked(_ sender: GameButton) {
        setsPlayerChoice(sender: sender)
        sender.isEnabled = false
        winningCombosCols(gameBoard: GameBoard.grid, button: sender)
        CheckForRows(gameBoard: GameBoard.grid, gameButton: sender)
        checksForDiagonals1(gameBoard: GameBoard.grid, gameButton: sender)
        checkForDiagonal2(gameBoard: GameBoard.grid, button: sender)
        checksWinner(arrayInt: colArray, label: playerTurnLabel)
        checksWinner(arrayInt: diagonialArray, label: playerTurnLabel)
        checksWinner(arrayInt: diagonalArray2, label: playerTurnLabel)
        checksWinner(arrayInt: rowArray, label: playerTurnLabel)
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
    func winningCombosCols(gameBoard:[[String]],button:GameButton) {
        for num in 0...button.row{
            for num1 in 0...button.col{
                if gameBoard[num][num1] == playerX.piece.rawValue  {
                    colArray[num] = 1
                    print("colArray: \(colArray)")
                }
                    
                else {
                    colArray[num] = 0
                    print("colArray: \(colArray)")
                }
            }
        }
    }
    
    func checksWinner(arrayInt:[Int],label:UILabel){
        sum = arrayInt.reduce(0){$0 + $1}
        print("arrayInt: \(arrayInt) ")
        if sum == 3 && playerX.piece.rawValue == "X" {
            label.text = "Player One Wins!"
        }
    }
    func CheckForRows(gameBoard:[[String]],gameButton:GameButton) {
        for secondNum in 0...gameButton.row{
            for thirdNum in 0...gameButton.col {
                if gameBoard[secondNum][thirdNum] == playerX.piece.rawValue {
                    rowArray[thirdNum] = 1
                    print("rowArray: \(rowArray)")
                    
                }else {
                    rowArray[thirdNum] = 0
                    print("rowArray: \(rowArray)")
                }
            }
        }
        
    }
    func checksForDiagonals1(gameBoard:[[String]],gameButton:GameButton){
        for num in 0...gameButton.row{
            for num2 in 0...gameButton.col{
                if gameBoard[num][num] == playerX.piece.rawValue {
                    diagonialArray[num2] = 1
                    print("diagonialArray: \(diagonialArray)")
                    
                }else{
                    diagonialArray[num2] = 0
                    print("diagonialArray: \(diagonialArray)")
                }
                
            }
        }
    }
    func checkForDiagonal2(gameBoard:[[String]],button:GameButton) {
        for num in 0...button.row{
            for num2 in stride(from: 2, to: 0, by: -1){
                if gameBoard[num2][num] == playerX.piece.rawValue {
                    diagonalArray2[num] = 1
                    print("diagonalArray2: \(diagonalArray2)")
                }else {
                    diagonalArray2[num] = 0
                    print("diagonalArray2: \(diagonalArray2)")
                }
            }
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






