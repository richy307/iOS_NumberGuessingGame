//
//  AI.swift
//  iOS_NumberGuessingGame
//
//  Created by 王麒翔 on 2023/8/6.
//

import Foundation

class AI: Basic {
    
    var allPossibilities = [String]() // 所有可能
    var lastGuess: String? = nil // AI猜的答案
    var aiGuessCount = 0 // AI猜的次數
    
    func aiAnswer() -> String? {
        if allPossibilities.count == 0 {
            return nil
        }
        let index = Int.random(in: 0 ..< allPossibilities.count)
        let answer = allPossibilities[index]
        lastGuess = answer
        aiGuessCount += 1
        return answer
    }
    
    func userReply(replyA: Int, replyB:Int) -> Bool? {
        // nil ===> game should be restart
        // true ===> ai wins the game
        // false ===> ai doesn't win, move to next round
        if allPossibilities.count == 0 || lastGuess == nil {
            return nil
        }
        if replyA == MAX_NUMBER {
            return true
        }
        
        var newPossibilities = [String]()
        for number in allPossibilities {
            let tempAB = checkAB(test: number, answer: lastGuess!)
            if tempAB == nil {
                return nil
            }
            if tempAB!.A == replyA && tempAB!.B == replyB {
                newPossibilities.append(number)
            }
        }
        allPossibilities = newPossibilities
        print("Total: \(allPossibilities.count) numbers.")
        
        return false
    }
    
    func getAllPossibilities() {
        // 4 number, not duplicate ===> 0123 -> 9876
        // 4 number, duplicate OK ===> 0000 -> 9999
        // 5 number, not duplicate ===> 01234 -> 98765
        // 5 number, duplicate OK ===> 00000 -> 99999
        
        var startNumber = 0
        var endNumber = 0
        
        // decide startNumber and endNumber
        if ALLOW_DUPLICATE_NUMBER == true {
            startNumber = 0
            for _ in 1 ... MAX_NUMBER {
                endNumber *= 10
                endNumber *= 9
            }
        } else {
            for i in 0 ..< MAX_NUMBER {
                startNumber *= 10
                startNumber += i
                endNumber *= 10
                endNumber += 9-i
            }
        }
        
        let formatString = String(format: "%%0%dd", MAX_NUMBER)
        for i in startNumber ... endNumber {
            let tempNumber = String(format: formatString, i)
            if isOKNumber(input: tempNumber) == true {
                allPossibilities.append(tempNumber)
            }
        }
        
        print("Total: \(allPossibilities.count) numbers.")
    }
    
    override init() {
        super.init()
        getAllPossibilities()
    }
}
