//
//  CalculationResultManager.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/24/24.
//

import Foundation
import UIKit

class CalculationResultManager: CalculationDisplayDelegate {
    
    weak var digitLabel: UILabel?
    
    func updateDigit(value: String, _ isResult: Bool) {
     
        if isResult , let num = Double(value) , num.truncatingRemainder(dividingBy: 1) == 0 {
            digitLabel?.text = "\(Int(num))"
        } else {
            digitLabel?.text = value
        }
    }
}
