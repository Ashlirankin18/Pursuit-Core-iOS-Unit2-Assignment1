//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var gameStateActive: Bool // this can be  used when there is a draw
    init(gameStateActive:Bool){
        self.gameStateActive = gameStateActive
    }
class PlayerInfo {
    var piece:GamePieces
    var playerTurn: Bool
    var personPiece = UIImage()
    var timesWon: Int
    init(piece:GamePieces,playerTurn:Bool,personPiece:UIImage,timesWon:Int) {
        self.piece = piece
        self.playerTurn = playerTurn
        self.personPiece = personPiece
        self.timesWon = timesWon
        }
    }
enum GamePieces: String{
        case X = "X"
        case O = "O"
    }
    struct GameBoard {
        var grid:[[String]]
    }
    }
