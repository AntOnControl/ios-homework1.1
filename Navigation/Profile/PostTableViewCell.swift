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
    
    func setupCell(model:ModelPost) {
        postImageView.image = UIImage(named: model.image)
        postText.text = model.author
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .systemGray3
        contentViewPost.layer.cornerRadius = 10
        contentViewPost.layer.borderColor = UIColor.black.cgColor
        contentViewPost.layer.borderWidth = 2
    }
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let postText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Text"
        return label
    }()
    
    private func layout(){
        [contentViewPost, postImageView, postText].forEach { contentView.addSubview($0)}
        
        let heightView: CGFloat = 100
        let viewInset: CGFloat = 8
        let imageInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            contentViewPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentViewPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            contentViewPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            contentViewPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -viewInset),
            contentViewPost.heightAnchor.constraint(equalToConstant: heightView)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentViewPost.topAnchor, constant: imageInset),
            postImageView.leadingAnchor.constraint(equalTo: contentViewPost.leadingAnchor, constant: imageInset),
            postImageView.heightAnchor.constraint(equalToConstant: heightView - imageInset * 2),
            postImageView.widthAnchor.constraint(equalToConstant: heightView - imageInset * 2),
        ])
        NSLayoutConstraint.activate([
            postText.topAnchor.constraint(equalTo: contentViewPost.topAnchor, constant: imageInset),
            postText.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: viewInset),
            postText.trailingAnchor.constraint(equalTo: contentViewPost.trailingAnchor)
        
        ])
    }
}
