//
//  ViewController.swift
//  iOS_NumberGuessingGame
//
//  Created by 王麒翔 on 2023/8/5.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var inputA: UITextField!
    @IBOutlet weak var inputB: UITextField!
    @IBOutlet weak var playerLog: UITextView!
    @IBOutlet weak var computerLog: UITextView!
    
    @IBAction func rest(_ sender: UIBarButtonItem) {
    }
    @IBAction func guess(_ sender: UIButton) {
    }
    @IBAction func reply(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playerLog.text = "----- Player -----\n"
        computerLog.text = "----- Computer -----\n"
        
    }


}

