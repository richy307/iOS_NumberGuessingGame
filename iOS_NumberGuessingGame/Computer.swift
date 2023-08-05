//
//  Computer.swift
//  iOS_NumberGuessingGame
//
//  Created by 王麒翔 on 2023/8/6.
//

import Foundation

class Computer: Basic {
    
    var answerUmberString = ""
    
    func generateAnswerNumberString() {
        // 產生答案
        var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        for _ in 1 ... MAX_NUMBER {
            let index = Int.random(in: 0 ..< numbers.count)
            let number = numbers[index]
            answerUmberString += number
            
            if ALLOW_DUPLICATE_NUMBER == false {
                numbers.remove(at: index)
            }
        }
    }
    
    override init() {
        super.init()
        generateAnswerNumberString()
    }
}
