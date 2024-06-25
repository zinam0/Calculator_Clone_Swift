//
//  OperationProtocol.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/22/24.
//

import Foundation

protocol OperationProtocol {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double
}

class Addition: OperationProtocol {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class Subtraction: OperationProtocol {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class Multiplication: OperationProtocol {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class Division: OperationProtocol {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}
