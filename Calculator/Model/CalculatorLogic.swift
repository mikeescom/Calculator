//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Saavedra Lozano, Miguel on 10/4/24.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC": return 0
            case "+/-": return n * -1
            case "%": return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            print(n1)
            print(operation)
            print(n2)
            if operation == "+" {
                return n1 + n2
            } else if operation == "-" {
                return n1 - n2
            } else if operation == "÷" {
                return n1 / n2
            } else if operation == "×" {
                return n1 * n2
            }
        }
        return 0
    }
}
