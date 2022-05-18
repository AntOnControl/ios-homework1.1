//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Anton Utin on 18.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Tiger"))
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Утин Антон rehthte erth etrher"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        nameLabel.frame = CGRect(x: imageView.frame.maxX + 16,
                                 y: 27, width: self.bounds.width - imageView.frame.width - 32 , height: 32)
    }
}
