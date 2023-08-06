//
//  Computer.swift
//  iOS_NumberGuessingGame
//
//  Created by 王麒翔 on 2023/8/6.
//

import Foundation

class Computer: Basic {
    
    var answerNumberString = ""
    var guessCount = 0
    
    func generateAnswerNumberString() {
        // 產生答案
        var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        for _ in 1 ... MAX_NUMBER {
            let index = Int.random(in: 0 ..< numbers.count)
            let number = numbers[index]
            answerNumberString += number
            
            if ALLOW_DUPLICATE_NUMBER == false {
                numbers.remove(at: index)
            }
        }
        print("==== Answer:\(answerNumberString)") // 答案
    }
    
    func userGuess(input: String) -> (A:Int, B:Int)? {
        let result = checkAB(test: input, answer: answerNumberString)
        if result != nil {
            guessCount += 1
        }
        return result
    }
    
    override init() {
        super.init()
        generateAnswerNumberString()
    }
}
