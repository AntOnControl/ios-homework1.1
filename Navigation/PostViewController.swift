//
//  PostViewController.swift
//  Navigation
//
//  Created by Anton Utin on 09.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    let post: Post
    
    init (post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    private func layout() {
        title = post.title
        view.backgroundColor = .systemCyan
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showInfo))
    }
    
    @objc func showInfo() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
}
