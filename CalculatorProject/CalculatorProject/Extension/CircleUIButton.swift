//
//  CircleUIButton.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/23/24.
//

import Foundation
import UIKit

@IBDesignable
class CircleUIButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
