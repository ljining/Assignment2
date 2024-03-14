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
            var input: String = ""         //값 입력 받기
            
            switch input {                 //경우 나누기
            case input != input.contains { $0.isNumber }:
                print("올바르지 않은 입력값입니다")
            
            case input.contains ("0"):
                print("올바르지 않은 입력값입니다")
            
            case input.count != 3:
                print("올바르지 않은 입력값입니다")
            
            else
            
            
        
    }
    
    func makeAnswer() {
        var array = Array(1...9)
        array.shuffle()
        array.removeSubrange(3...8)
    }
}
