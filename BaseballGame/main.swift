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
            
            //input 값이 유효한지 확인하는 함수
            func validInput(_ input: String?) -> Bool {
                guard let input = input,
                      input.allSatisfy({ $0.isNumber }),
                      input.count == 3,
                      !input.contains("0"),
                      !duplicate(input)
                else {
                    return false
                }
                return true
            }
            
            //input 값 내부에 중복된 문자 있는지 확인하는 함수
            func duplicate(_ input: String) -> Bool {
                var number = Set<Character>() //빈 문자집합(Set) 생성
                for num in input {
                    if number.contains(num) {
                        return true
                    }
                    number.insert(num)       //문자 집합에 새로운 문자 추가(중복된 문자 없는 경우에만 추가됨)
                }
                return false
            }
            
            //게임 실행하는 함수
            func startGame(_ input: String, _ generatedAnswer: Int) -> Bool {
                
                let str1 = input
                let str2 = String(generatedAnswer)
                var strike = 0
                var ball = 0
                
                
                
         
            }
            
            //랜덤 정답 만드는 함수
            func makeAnswer() -> Int {
                var array = Array(1...9)
                array.shuffle()
                array.removeSubrange(3...8)
                
                guard let answer = Int(array.map { String($0) }.joined())   //joined() 배열 요소 하나의 문자열로 합쳐서 사용
                else { print("Error")
                }
                return answer
            }
            let generatedAnswer = makeAnswer()
            
            
            let game = NumberBaseball()
            game.start()
            
        }
    }
}
