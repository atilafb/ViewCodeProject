//
//  ViewControllerScreen.swift
//  ViewCodeProject
//
//  Created by Atila Bastos on 07/09/21.
//

import UIKit

protocol ViewControllerScreenDelegate {
    func communicate(_ viewControllerScreen: ViewControllerScreen, communicate: UIButton)
}

final class ViewControllerScreen: UIView {
    
    var delegate: ViewControllerScreenDelegate?
    
    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .red
        view.setTitle("Fetch", for: .normal)
        // Adicionando o target ao botão para dar a ação do pressionar.
        view.addTarget(self, action: #selector(self.fetchPressed), for: .touchUpInside)
        return view
    }()
    
    private lazy var gridContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 8.0
        return view
    }()
    
    let leftBox = GridBoxView()
    let rightBox = GridBoxView()
    let topBox = BoxView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    // Esse método é utilizado quando usamos storyboard. Aqui ele deve ser chamado com esse fatalError.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Método que vai dar a ação do botão pressionado. (Substituindo o antigo @IBAction usado no Storyboard)
    @objc func fetchPressed(sender: UIButton) {
        delegate?.communicate(self, communicate: button)
    }
    
}


extension ViewControllerScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(button)
        gridContainer.addArrangedSubview(leftBox)
        gridContainer.addArrangedSubview(rightBox)
        addSubview(gridContainer)
        addSubview(topBox)
    }
    
    func setupConstraints() {
        
        gridContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(300)
            make.centerY.equalToSuperview()
        }
        
        topBox.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(150)
            make.centerY.equalToSuperview().offset(-250)
        }
        
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.bottom.equalTo(self).inset(15)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
    
}
