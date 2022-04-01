//
//  ViewController.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import UIKit

import Elements

class ViewController: UIViewController {
    
    lazy var button : BaseUIButton = {
        let button = BaseUIButton()
        button.setTitle("Test", for: .normal)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .blue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(moveHandler), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func moveHandler(){
        let vc = CoreDataPracticeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("tapped")
    }
    
}

