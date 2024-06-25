//
//  ViewController.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/23/24.
//

import UIKit

final class ViewController: UIViewController {
    
    var inputManager = CalculationManager()
    var displayManager = CalculationResultManager()
    
    @IBOutlet weak var digitLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputManager.displayDelegate = displayManager
        displayManager.digitLabel = digitLabel
        
        inputManager.clearButtonTapped()
    }
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        inputManager.digitButtonTapped(sender.currentTitle)
    }
    
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        inputManager.operationButtonTapped(sender.currentTitle)
    }
    
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        inputManager.equalsButtonTapped()
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        inputManager.clearButtonTapped()
    }
    
    
    @IBAction func negateButtonTapped(_ sender: UIButton) {
        inputManager.negateButtonTapped()
    }
    
    @IBAction func percentageButtonTapped(_ sender: UIButton) {
        inputManager.percentageButtonTapped()
    }
    
}




