//
//  Basic.swift
//  iOS_NumberGuessingGame
//
//  Created by 王麒翔 on 2023/8/6.
//

import Foundation

class Basic {
    
    let MAX_NUMBER = 4 // 最大字數
    let ALLOW_DUPLICATE_NUMBER = false
    
    func isOKNumber(input: String)-> Bool {
        
        // check length
        if input.count != MAX_NUMBER {
            return false
        }
        
        // check if it's number
        if Int(input) == nil {
            return false
        }
        
        // check duplicate numbers
        if ALLOW_DUPLICATE_NUMBER == false {
            let inputArray = Array(input)
            let inputSet = Set(inputArray)
            
            if inputArray.count != inputSet.count {
                return false
            }
        }
        
        return true
    }
    
    // 檢查幾A幾B
    func checkAB(test: String, answer: String) -> (A:Int, B:Int)? {
        
        if isOKNumber(input: test) == false || isOKNumber(input: answer) == false {
            return nil
        }
        
        var resultA = 0
        var resultB = 0
        let testArray = Array(test)
        let answerArray = Array(answer)
        
        for i in 0 ..< MAX_NUMBER {
            for j in 0 ..< MAX_NUMBER {
                
                if testArray[i] == answerArray[j] && i == j {
                    // A：數字相同、位置相同
                    resultA += 1
                } else if testArray[i] == answerArray[j] {
                    // B：數字相同、位置不同
                    resultB += 1
                }
            }
        }
        return (A:resultA, B:resultB)
    }
    
}
