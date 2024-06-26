//
//  CalculationManager.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/24/24.
//

import Foundation

class CalculationManager: CalculationInputDelegate {
    
    weak var displayDelegate: CalculationDisplayDelegate?
    
    var currentNumber: String?
    var previousNumber: String?
    var previousEqualNum: String?
    var operation: OperationProtocol?
    var isCalculate: Bool = false
    var isPreviousEqualsTapped: Bool = false
    
    func digitButtonTapped(_ digit: String?) {
        guard let digit = digit else { return }
        isPreviousEqualsTapped = false
        if digit == "." && ((currentNumber?.contains("."))!) { return }
        if isCalculate {
            currentNumber! += digit
        } else {
            if digit == "." {
                currentNumber = "0."
            } else {
                currentNumber = digit
            }
            isCalculate = true
        }
        displayDelegate?.updateDigit(value: currentNumber ?? "0", false)
    }
    
    func operationButtonTapped(_ operation: String?) {
        guard let op = operation else { return }
        isPreviousEqualsTapped = false
        calculationPerform(op)
        isCalculate = false
        previousNumber = currentNumber
    }
    
    func clearButtonTapped() {
        currentNumber = "0"
        previousNumber = "0"
        operation = nil
        isCalculate = false
        displayDelegate?.updateDigit(value: currentNumber ?? "0", false)
    }
    
    
    func negateButtonTapped() {
        guard let num = Double(currentNumber ?? "0") else { return }
        isPreviousEqualsTapped = false
        currentNumber = "\(-num)"
        
        displayDelegate?.updateDigit(value: currentNumber ?? "0", true)
    }
    
    func percentageButtonTapped() {
        guard let num = Double(currentNumber ?? "0") else { return }
        isPreviousEqualsTapped = false
        currentNumber = "\(num / 0.01)"
        displayDelegate?.updateDigit(value: currentNumber ?? "0", true)
    }
    
    func equalsButtonTapped() {
        guard let op = operation else { return }
        guard let curnum = Double(currentNumber ?? "0"), let prevnum = Double(previousNumber ?? "0") else { return }
        
        isCalculate = false
        let result = op.calculate(prevnum, curnum)
        if isPreviousEqualsTapped {
            currentNumber = "\(result)"
            previousNumber = previousEqualNum
            
        } else {
            previousNumber = "\(curnum)"
            previousEqualNum = "\(curnum)"
            currentNumber = "\(result)"
            isPreviousEqualsTapped = true
        }
        displayDelegate?.updateDigit(value: currentNumber ?? "0", true)
    }
    
    
    func calculationPerform(_ op: String){
        switch op {
        case "+":
            self.operation = Addition()
        case "-":
            self.operation = Subtraction()
        case "x":
            self.operation = Multiplication()
        case "÷":
            self.operation = Division()
        default:
            break
        }
    }
}
