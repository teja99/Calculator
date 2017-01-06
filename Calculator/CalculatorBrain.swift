//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Phaniteja Nunna on 1/3/17.
//  Copyright © 2017 Phaniteja Nunna. All rights reserved.
//

import Foundation

func multiply(op1: Double, op2: Double) -> Double
{
    return op1 * op2
}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double)  {
        accumulator = operand
    }
    
   private var operations: Dictionary<String, Operation>  = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),//M_E
        "√": Operation.UnaryOperation(sqrt),//sqrt
        "cos": Operation.UnaryOperation(cos),
        "x": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "=": Operation.Equals
    ]
    
   private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
    case Equals
    }
    
    func performOperation(symbol: String)  {
        if let operation = operations[symbol]
        {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation (let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
       /* switch symbol {
        case "π":
            accumlator = M_PI
        case "√":
            accumlator = sqrt(accumlator)
        default:
            break
        }*/
        /*
        if let constant = operations[symbol]{
            accumlator = constant*/
        
        }
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}
