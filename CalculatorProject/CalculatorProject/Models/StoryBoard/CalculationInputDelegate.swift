//
//  CalculationDelegate.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/23/24.
//

import Foundation

protocol CalculationInputDelegate: AnyObject {
    func digitButtonTapped(_ digit: String?)
    func operationButtonTapped(_ operation: String?)
    func clearButtonTapped()
    func negateButtonTapped()
    func percentageButtonTapped()
    func equalsButtonTapped()
}

protocol CalculationDisplayDelegate: AnyObject {
    func updateDigit(value: String, _ isResult: Bool)
}

