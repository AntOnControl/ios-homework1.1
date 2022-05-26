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
        view.backgroundColor = .systemRed         // Do any additional setup after loading the view.
        view.addSubview(postButtom)
        postButtom.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButtom.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
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
