//
//  ViewController.swift
//  Calculator
//
//  Created by Saavedra Lozano, Miguel on 10/3/24.
//

import UIKit

class ViewController: UIViewController {

    private var isFinishedTypingNumber: Bool = true
    private var didDecimalPointAdded: Bool {
        return displayLabel.text?.contains(".") ?? false
    }
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double!")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
    
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                print("Result: \(result)")
                displayValue = result
            }
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if !(numValue.last == "." && didDecimalPointAdded) {
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
    }


}

