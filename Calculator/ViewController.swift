//
//  ViewController.swift
//  Calculator
//
//  Created by Jonathan Burnett on 16/12/2020.
//

import UIKit

enum Operation:String {
    case add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
        
        
        
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8 {
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearedPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .Null
        outputLabel.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 7 {
        runningNumber += "."
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operatio(operation: currentOperation)
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        operatio(operation: .add)
    }
    
    @IBAction func miniusPressed(_ sender: UIButton) {
        operatio(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operatio(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operatio(operation: .Divide)
    }
    
    func operatio (operation: Operation) {
        if currentOperation != .Null {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    
                }else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    
                }else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                leftValue = result
                outputLabel.text = result
            }
            
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
}


