//
//  ViewController.swift
//  iOS_NumberGuessingGame
//
//  Created by 王麒翔 on 2023/8/5.
//

import UIKit

class ViewController: UIViewController {
    
    var computer = Computer()
    var ai = AI()
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var inputA: UITextField!
    @IBOutlet weak var inputB: UITextField!
    @IBOutlet weak var playerLog: UITextView!
    @IBOutlet weak var computerLog: UITextView!
    
    @IBAction func rest(_ sender: UIBarButtonItem) {
        computerLog.text = "Game restarted, please guess first!/n"
        computer = Computer()
        ai = AI()
        playerLog.text = ""
    }
    
    @IBAction func guess(_ sender: UIButton) {
        guard let guessText = guessTextField.text else { return }
        guessTextField.text = ""
        if computer.isOKNumber(input: guessText) == false {
            computerLog.text += "Wrong input: \(guessText) \nPlease guess again!\n"
        }
        guard let result = computer.userGuess(input: guessText) else { return }
        playerLog.text += "[\(computer.guessCount)]: \(guessText) ==> \(result.A)A, \(result.B)B\n"
        if result.A == computer.MAX_NUMBER {
            playerLog.text += "Player wins the game, you may restart a new one.\n"
            return
        }
        let aiGuessNumber = ai.aiAnswer()
        if aiGuessNumber == nil {
            computerLog.text += "Computer don't know how to guess, maybe we should restart the game?\n"
        } else {
            computerLog.text += "[\(ai.aiGuessCount)]:" + aiGuessNumber!
        }
    }
    
    @IBAction func reply(_ sender: UIButton) {
        guard let replyA = inputA.text, let replyB = inputB.text else{ return }
        inputA.text = ""
        inputB.text = ""
        if replyA == "" || replyB == ""{
            computerLog.text += "Wrong Input: A or B can’t be empty!\n"
            return
        }
        if Int(replyA) == nil || Int(replyB) == nil{
            computerLog.text += "Wrong Input: A or B must be number!\n"
        }
        let numberA = Int(replyA)
        let numberB = Int(replyB)
        let result = ai.userReply(replyA: numberA!, replyB: numberB!)
        if result == nil{
            computerLog.text += "Computer don't know how to guess, maybe we should restart the game?\n"
        }else if result == true{
            computerLog.text += "\nComputer wins the game\n"
        }else{
            computerLog.text += "==> \(replyA)A,\(replyB)B\n"
            computerLog.text  += "Your turn to guess. \n"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playerLog.text = "----- Player -----\n"
        computerLog.text = "----- Computer -----\n"
        computerLog.text += "Welcome, please guess first.\n"
        
    }


}

