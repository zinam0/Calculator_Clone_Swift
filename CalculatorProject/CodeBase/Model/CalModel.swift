//
//  CalModel.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/27/24.
//

import Foundation

protocol CalModelDelegate: AnyObject {
    func updateValueDisplay(_ value: String)
}

final class CalculatorModel {
    
    weak var delegate: CalModelDelegate?
    
    private var digitValue: String = ""
    private var isTyping: Bool = false
    private let operators = CharacterSet(charactersIn: "+-*/")
    
    var displayValue: String {
        return digitValue.isEmpty ? "0" : digitValue
    }
    
    private var isOperator: Bool {
        guard let lastChar = digitValue.last else { return false }
        return operators.contains(UnicodeScalar(String(lastChar))!)
    }
    
    func updateDisplay(with text: String) {
        switch text {
        case "AC":
            clear()
        case "=":
            resultTapped()
        case "+", "-", "*", "/":
            operateTapped(text)
        default:
            digitTapped(text)
            
        }
        delegate?.updateValueDisplay(displayValue)
    }
    
    private func operateTapped(_ operator: String) {
        if isOperator {
            return
        }
        digitValue += `operator`
        isTyping = true
    }
    
    private func digitTapped(_ digit: String) {
        if digit == "0" && digitValue == "0" {
            return
        }
        digitValue = isTyping ? digitValue + digit : digit
        isTyping = true
    }
    
    private func clear() {
        digitValue = "0"
        isTyping = false
    }
    
    private func resultTapped() {
        if isOperator {
            return
        }
        digitValue = "\(calculateExpression(digitValue) ?? 0)"
        isTyping = false
    }
    
    private func calculateExpression(_ expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        return expression.expressionValue(with: nil, context: nil) as? Int
    }
}
