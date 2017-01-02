//
//  ViewController.swift
//  Calculator
//
//  Created by Phaniteja Nunna on 1/2/17.
//  Copyright © 2017 Phaniteja Nunna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsIntheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) digit")
        if userIsIntheMiddleOfTyping
        {
            let textCurrentlyInDisplay = display.text
            display.text = textCurrentlyInDisplay! + digit
        }
        else{
            display.text = digit
        }
        userIsIntheMiddleOfTyping = true
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsIntheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle{
            if mathematicalSymbol == "π"{
                display.text = String(M_PI)
            }
        }
    }
}
