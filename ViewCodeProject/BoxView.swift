//
//  BoxView.swift
//  ViewCodeProject
//
//  Created by Atila Bastos on 09/09/21.
//

import UIKit

final class BoxView: UIView {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var boxContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 8.0
        return view
    }()
    
    lazy var textContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 8.0
        return view
    }()
    
    lazy var buttonContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 8.0
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var subtitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .green
        return view
    }()
    
    lazy var buttonOne: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .systemPink
        return view
    }()
    
    lazy var buttonTwo: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .cyan
        return view
    }()
    

    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }
    
    // Esse método é utilizado quando usamos storyboard. Aqui ele deve ser chamado com esse fatalError.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BoxView: CodeView {
    func buildViewHierarchy() {
        addSubview(imageView)
        textContainer.addArrangedSubview(title)
        textContainer.addArrangedSubview(subtitle)
        addSubview(textContainer)
        buttonContainer.addArrangedSubview(buttonOne)
        buttonContainer.addArrangedSubview(buttonTwo)
        addSubview(buttonContainer)
    }
    
    func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalToSuperview().multipliedBy(0.4)
        }
        
        textContainer.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalTo(imageView.snp.right).offset(8)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        buttonContainer.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
            make.left.equalTo(imageView.snp.right).offset(8)
            make.top.equalTo(textContainer.snp.bottom).offset(8)
        }
    }
    
    func setupAdditionalConfiguration() {
    }
    
}

