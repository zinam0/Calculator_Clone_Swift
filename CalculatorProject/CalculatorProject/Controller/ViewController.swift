//
//  ViewController.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/23/24.
//

import UIKit

final class ViewController: UIViewController, CalModelDelegate, CalViewDelegate {
    
    private let model = CalculatorModel()
    //명확하게 호출하면 버그 확률을 적어짐
    private let calculatorView = CalView(frame: .zero) //0,0,0,0으로 초기화
    
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

