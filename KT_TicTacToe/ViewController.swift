//
//  ViewController.swift
//  KT_TicTacToe
//
//  Created by Paresh Patel on 12/14/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     0,x
     1,x
     2,x
     
     x,0
     x,1
     x,2
     
     x,x -> x = x
     
     x,y -> x+y = (No. of rows - 1)
     
     where x or y can be 0...n-1
     
     */

    let n = 3
    var arrData = [[Int]]()
    
    let playerOne = Player(name: "A", isStartingPlayer: true, assignedValue: 0, move: 0)
    let playerTwo = Player(name: "B", isStartingPlayer: false, assignedValue: 1, move: 0)
    
    var moveNumber = 1
    var currentPlayer : Player?
    var totalPlayers = 2
    
    func setCurrentPlayer(){
        if moveNumber % totalPlayers == 1 {
            if playerOne.isStartingPlayer == true {
                currentPlayer = playerOne
            }else {
                currentPlayer = playerTwo
            }
        } else {
            if playerOne.isStartingPlayer == false {
                currentPlayer = playerOne
            }else {
                currentPlayer = playerTwo
            }
        }
    }
    func performMove(row: Int, column: Int){
        if arrData[row][column] > -1 {
            // error - row and column is alreay used by player
            print("error - row and column is alreay used by player")
            return
        }
        arrData[row][column] = currentPlayer!.assignedValue
        moveNumber += 1
        
        if let winnerPlayer = checkResult() {
            print("Winner Name: \(winnerPlayer.name)")
            // show winner player and close the game
        } else if CheckIsMoveAvailable() == false{
            print("No moves available, game is closed")
            // close the game without any winner
        } else {
            setCurrentPlayer()
        }
    }
    func CheckIsMoveAvailable() -> Bool {
        if moveNumber > n*n {
            return false
        }
        return true
    }
    func generateBase(number: Int) {
         arrData = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
    }
    func checkResult() ->  Player? {
        if let res = checkResultForRows() {
            if res == currentPlayer!.assignedValue {
                return currentPlayer!
            } else {
                // error
                return nil
            }
        } else if let res = checkResultForColumns() {
            if res == currentPlayer!.assignedValue {
                return currentPlayer!
            } else {
                // error
                return nil
            }
        } else if let res = checkResultForLeftDiagonal() {
            if res == currentPlayer!.assignedValue {
                return currentPlayer!
            } else {
                // error
                return nil
            }
        } else if let res = checkResultForRightDiagonal() {
            if res == currentPlayer!.assignedValue {
                return currentPlayer!
            } else {
                // error
                return nil
            }
        } else {
            return nil
        }
    }
    func checkResultForRows() -> Int? {
        
        for i in 0..<n {
            var isMatched = true
            let firstValue = arrData[i][0]
            for j in 1..<n {
                if firstValue != arrData[i][j] {
                    isMatched = false
                    break
                }
            }
            if isMatched == true && firstValue > -1 {
                return firstValue
            }
        }
        return nil
    }
    func checkResultForColumns() -> Int? {
        
        for i in 0..<n {
            var isMatched = true
            let firstValue = arrData[0][i]
            for j in 1..<n {
                if firstValue != arrData[j][i] {
                    isMatched = false
                    break
                }
            }
            if isMatched == true && firstValue > -1 {
                return firstValue
            }
        }
        return nil
    }
    func checkResultForLeftDiagonal() -> Int? {
        var isMatched = true
        let firstValue = arrData[0][0]
        
        for i in 1..<n {
            if  firstValue != arrData[i][i] {
                isMatched = false
                break
            }
        }
        if isMatched == true && firstValue > -1 {
            return firstValue
        }
        return nil
    }
    func checkResultForRightDiagonal() -> Int? {
        var isMatched = true
        let firstValue = arrData[0][n-1]
        
        for i in 1..<n {
            if  firstValue != arrData[i][n-1-i] {
                isMatched = false
                break
            }
        }
        if isMatched == true && firstValue > -1 {
            return firstValue
        }
        return nil
    }
    
}

