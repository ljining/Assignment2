//
//  main.swift
//  BaseballGame
//
//  Created by 이유진 on 3/14/24.
//

import Foundation


class NumberBaseball {
    
    //게임 시작 함수
    func start() {
        
        //랜덤 정답 만드는 함수
        func makeAnswer() -> Int {
            var array = Array(1...9)
            array.shuffle()
            array.removeSubrange(3...8)
            
            let answer = Int(array.map { String($0) }.joined()) ?? 0   //joined() 배열 요소 하나의 문자열로 합쳐서 사용
            return answer
        }
        let generatedAnswer = makeAnswer()
        
        
        while true{
            print("< 게임을 시작합니다 >")
            print("숫자를 입력하세요")
            let input = readLine()       //값 입력 받기
            if validInput(input) {
                if startGame(input!, generatedAnswer) {
                    break                    //게임 실행 후 루프 종료
                }
            } else {
                print("올바르지 않은 입력값입니다.")
            }
            
            //새로운 게임 시작
            let game = NumberBaseball()
            game.start()
            
            
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
                
                for (index, char) in str1.enumerated() {    //str1 순회하는 동안 str1의 요소(=문자)와 해당 요소의 인덱스를 동시에 확인할 수 있도록한다.
                    let answerIndex = str2.index(str2.startIndex, offsetBy: index) //str2에서 str2의 첫번째 인덱스로부터의 거리를 구한다.
                    let answerChar = str2[answerIndex]  //str2에서 구한 인덱스의 거리에 위치해 있는 문자를 담을 상수를 만든다.
                    
                    if  answerChar == Character(str2) { //문자와 인덱스 둘 다 일치하는 경우
                        strike += 1
                    } else if str2.contains(char) {      //문자는 일치하는데 인덱스는 일치하지 않는 경우
                        ball += 1
                    }
                }
                
                if strike == 3 {
                    print("정답입니다!")
                    return true
                } else if strike > 0 || ball > 0 {
                    print("\(strike)스트라이크 \(ball)볼")
                }
                
                return false
            }
        }
    }
}
