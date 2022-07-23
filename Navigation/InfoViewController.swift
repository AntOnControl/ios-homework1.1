//
//  InfoViewController.swift
//  Navigation
//
//  Created by Anton Utin on 10.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var postButtom: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("New Alert", for: .normal)
        buttom.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return buttom
    }()
    
    @objc func showAlert() {
        let vc = UIAlertController(title: "Alert", message: "Delete Post?", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "Cancel", style: .cancel)
        vc.addAction(alertAction1)
        let alertAction2 = UIAlertAction(title: "Ok", style: .default) { _ in print("delete post")}
        vc.addAction(alertAction2)
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    private func layout() {
        view.backgroundColor = .systemRed
        view.addSubview(postButtom)
        postButtom.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButtom.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
