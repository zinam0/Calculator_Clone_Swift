//
//  ViewController.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/23/24.
//

import UIKit

final class ViewController: UIViewController, CalModelDelegate, CalViewDelegate {
    
    private let model = CalculatorModel()
    private let calculatorView = CalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        calculatorView.delegate = self
        setupCalculatorView()
    }
    
    private func setupCalculatorView() {
        view.addSubview(calculatorView)
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.topAnchor.constraint(equalTo: view.topAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func updateValueDisplay(_ value: String) {
        calculatorView.updateDisplay(value)
    }
    
    func buttonTapped(label: String) {
        model.updateDisplay(with: label)
    }
}

