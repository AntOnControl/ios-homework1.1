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
        label.text = "Hipster Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var nameLabel2: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
      
        return button
    }()
    
    @objc func buttonPressed() {
        print("статус")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(nameLabel2)
        addSubview(showStatusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        nameLabel.frame = CGRect(x: imageView.frame.maxX + 16,
                                 y: 27, width: self.bounds.width - imageView.frame.width - 32 , height: 32)
        nameLabel2.frame = CGRect(x: imageView.frame.maxX + 16,
                                  y: imageView.frame.height,
                                  width: self.bounds.width - imageView.frame.width - 32 ,
                                  height: 32)
        
        showStatusButton.frame = CGRect(x: 16, y: imageView.frame.height + 32 , width: self.bounds.width - 32 , height: 50)
    }
}
