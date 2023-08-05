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
    
}
