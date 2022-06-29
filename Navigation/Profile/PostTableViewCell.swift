//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Anton Utin on 29.06.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let contentViewPost: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .systemGray3
    }
    
    private func layout(){
        contentView.addSubview(contentViewPost)
        
        NSLayoutConstraint.activate([
            contentViewPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentViewPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentViewPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contentViewPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            contentViewPost.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
