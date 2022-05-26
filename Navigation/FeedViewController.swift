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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemMint
        
        view.addSubview(postButtom)
        postButtom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButtom.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func openPost() {
        let vc = PostViewController(post: post)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
