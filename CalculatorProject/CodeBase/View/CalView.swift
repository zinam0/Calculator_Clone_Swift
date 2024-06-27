//
//  CalView.swift
//  CalculatorProject
//
//  Created by 남지연 on 6/27/24.
//

import UIKit

protocol CalViewDelegate: AnyObject {
    func buttonTapped(label: String)
}

class CalView: UIView {

    
    weak var delegate: CalViewDelegate?
    
    private let calLabels: [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]
    
    private let digitLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    //programming view init  - why?..
    //초기 위치와 크기를 설정하는데 사용
    //nib file / xib 로드된 객체는 init(corder) 사용해서 초기화됨
    //rectangle을 가지고 구현하고자 하는 뷰와 중심과 경계선이 지정이됨
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    //storyboard view init - 반드시 구현 (ㅇ)
    //nib file view load
    //required 키워드 때문에 반드시 구현해야함
    //스토리보드를 사용하지 않고 있지만 프로토콜을 준수하는 클래스에서 프로토콜을 요구하는 이니셜라이져
    //요구사항을 구현하려면 reuiqred키워드가 붙음
    //NSCoding protocol을 채탱하고 있는데 실패가능 이니셜라이저를 작성하도록 되어있음
    required init?(coder: NSCoder) {
        super.init(coder: <#T##NSCoder#>)
        //fatalError("init(coder:) has not been implemented")
        makeUI()
    }
    
    
    private func makeUI() {
        backgroundColor = .black
        makeView()
        setupButtons()
    }
    
    private func makeView() {
        addSubview(digitLabel)
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            digitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            digitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            digitLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            digitLabel.heightAnchor.constraint(equalToConstant: 100),
            
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: digitLabel.bottomAnchor, constant: 60),
            verticalStackView.widthAnchor.constraint(equalToConstant: 350),
            verticalStackView.heightAnchor.constraint(equalToConstant: 380),
        ])
    }
    
   
    private func setupButtons() {
        for row in calLabels {
            let horizontalStackView = createHorizontalStackView()
            verticalStackView.addArrangedSubview(horizontalStackView)
            for title in row {
                let button = createButton(with: title)
                horizontalStackView.addArrangedSubview(button)
            }
        }
    }
    
    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    private func createButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = (Int(title) != nil) ? UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0) : .orange
        button.layer.cornerRadius = 40
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        delegate?.buttonTapped(label: title)
    }
    
    func updateDisplay(_ value: String) {
        digitLabel.text = value
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
