//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anton Utin on 09.05.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    let modelPost = ModelPost.createModelPost()
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupNS()
    }
    private func layout(){
        view.addSubview(tableView)
        
    }
    private func setupNS() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        var content: UIListContentConfiguration = cell.defaultContentConfiguration()
//        content.text = "modelPost.\(indexPath.row)"
//        cell.contentConfiguration = content
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                                                 
    return cell
    }
    
    
}

extension ProfileViewController: UITableViewDelegate {
    
}
