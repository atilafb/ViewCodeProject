//
//  ViewController.swift
//  ViewCodeProject
//
//  Created by Atila Bastos on 07/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let screen = ViewControllerScreen()
    
    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate = self
        
    }

}

// Para fazer a comunicação entre a View com a Controller a gente cria o método na própria View e se comunica com a Controller via delegate.

extension ViewController: ViewControllerScreenDelegate {
    func communicate(_ viewControllerScreen: ViewControllerScreen, communicate: UIButton) {
        print("Fetch button pressed")
    }

}
