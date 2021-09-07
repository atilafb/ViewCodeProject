//
//  ViewCode.swift
//  ViewCodeProject
//
//  Created by Atila Bastos on 07/09/21.
//


// Definimos um protocolo para organizar através de métodos o que deve ser feito para construir uma Interface usando ViewCode, definirmos uma ordem em que esses passos devam ser executados e padronizar a construção para facilitar o entendimento caso hajam mais pessoas trabalhando em um projeto.
protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    
    // Apenas criar o protocolo para informar os passos que deve ser executados não é o suficiente.
    // Para isso criamos o setupView(), que através do extension irá customizar a ordem que deve ser seguida para a execução do código.
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
