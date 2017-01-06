//
//  ViewController.swift
//  Calculator
//
//  Created by Phaniteja Nunna on 1/2/17.
//  Copyright © 2017 Phaniteja Nunna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
   private var userIsIntheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
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
    
   private var displayValue: Double
        {
        get{
        return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsIntheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsIntheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
            /*if mathematicalSymbol == "π"{
                displayValue = M_PI
            }else if mathematicalSymbol == "√"
            {
                displayValue = sqrt(displayValue)
            }*/
            displayValue = brain.result
        }

}
