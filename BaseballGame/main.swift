//
//  main.swift
//  BaseballGame
//
//  Created by 이유진 on 3/14/24.
//

import Foundation


class NumberBaseball {
    
    func start() {
        while true{
            print("< 게임을 시작합니다 >")
            print("숫자를 입력하세요")
            let input = readLine()       //값 입력 받기
            if validInput(input) {
                startGame(input)
                break                    //게임 실행 후 루프 종료
            } else {
                print("올바르지 않은 입력값입니다.")
            }
            
            
            
            
            
        }
        
        func makeAnswer() {
            var array = Array(1...9)
            array.shuffle()
            array.removeSubrange(3...8)
        }
        
        
        let game = NumberBaseball()
        game.start()
        
    }
}
    
