//
//  main.swift
//  BaseballGame
//
//  Created by 이유진 on 3/14/24.
//

import Foundation


class NumberBaseball {
    
    func start() {
        var array = Array(1...9)
        array.shuffle()
        array.removeSubrange(3...8)

        print(array)
    }
    
}

let game = NumberBaseball()
game.start()
