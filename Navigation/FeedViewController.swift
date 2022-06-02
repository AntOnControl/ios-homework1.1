//
//  FeedViewController.swift
//  Navigation
//
//  Created by Anton Utin on 09.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let post: Post = Post(title: "New Post")
   
    private lazy var postButtom: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Open Post", for: .normal)
        buttom.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        return buttom
    }()
    private lazy var postButtom2: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Open Post2", for: .normal)
        buttom.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        return buttom
    }()
    
    private lazy var feedStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postButtom, postButtom2])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemMint
        view.addSubview(feedStackView)
        NSLayoutConstraint.activate([
            feedStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]) 
    }
    
    @objc func openPost() {
        let vc = PostViewController(post: post)
        navigationController?.pushViewController(vc, animated: true)
    }
}
