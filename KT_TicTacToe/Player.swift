//
//  Player.swift
//  KT_TicTacToe
//
//  Created by Paresh Patel on 12/14/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

class Player: NSObject {

    let name : String
    let isStartingPlayer : Bool
    let assignedValue : Int
    var move : Int = 0
    
    init(name : String, isStartingPlayer : Bool, assignedValue : Int, move : Int) {
        self.name = name
        self.isStartingPlayer = isStartingPlayer
        self.assignedValue = assignedValue
        self.move = move
    }
}
