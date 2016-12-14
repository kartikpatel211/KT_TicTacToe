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
    
    func generateBase(number: Int) {
         arrData = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
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
    func checkLeftDiagonal() -> Int? {
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
    func checkRightDiagonal() -> Int? {
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

