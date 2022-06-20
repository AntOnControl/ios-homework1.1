//
//  LogInViewController.swift
//  Navigation
//
//  Created by Anton Utin on 09.06.2022.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        layout()
//        //navigationController?.tabBarController?.tabBar.isHidden = true
//        let subLayer = CALayer()
//        subLayer.backgroundColor = UIColor.red.cgColor
//        subLayer.shadowOffset = CGSize(width: 0.0, height: 0.3)
//        subLayer.shadowRadius = 5.0
//        subLayer.shadowOpacity = 0.8
//        subLayer.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
//        view.layer.addSublayer(subLayer)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func layout() {
        view1.addSubview(imageLogo)
        view1.addSubview(buttonLogIn)
        view1.addSubview(inputTextLogin)
        view1.addSubview(inputTextPassword)
        view.addSubview(view1)
        //view.addSubview(scrollView)
        setupConstraints()
        //view.layer.addSublayer(subLayer) //тест слоев
    }
    
    private lazy var imageLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
    return logo
    }()
    
    private lazy var buttonLogIn: UIButton = {
        let logIn = UIButton()
        let bgImageNormal = UIImage(named: "blue_pixel")
        
        logIn.setBackgroundImage(bgImageNormal, for: .normal)
        logIn.setTitle("Log In", for: .normal)
        //bgImage.alpha = 0.8
        logIn.layer.cornerRadius = 50
        logIn.titleLabel?.textColor = .black
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
    }()
    private lazy var inputTextLogin: UITextField = {
        let textField = UITextField()
        textField.text = "Email of phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        
        //textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private lazy var inputTextPassword: UITextField = {
        let textField = UITextField()
        textField.text = "Password"
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var subLayer: CALayer = {
    subLayer.backgroundColor = UIColor.red.cgColor
    subLayer.shadowOffset = CGSize(width: 0.0, height: 0.3)
    subLayer.shadowRadius = 5.0
    subLayer.shadowOpacity = 0.8
    subLayer.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
    return subLayer
    }()
    
    private lazy var view1: UIView = {
        view1 = UIView()
        view1.backgroundColor = .red
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    private lazy var scrollView1: UIScrollView = {
        scrollView1 = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: view.frame.size.height - 20))
        scrollView1.backgroundColor = .green
        return scrollView1
    }()
    
    
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            imageLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
           // imageLogo.topAnchor.constraint(equalTo: (view1.centerYAnchor)),
           // imageLogo.topAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0.3),
           // imageLogo.topAnchor.constraint(equalTo: topAnchor, constant: 160),
           // imageLogo.topAnchor.constraint(equalTo: topAn, constant: 400),
            
            inputTextLogin.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            inputTextLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextLogin.heightAnchor.constraint(equalToConstant: 50),
            inputTextLogin.widthAnchor.constraint(equalToConstant: view.frame.size.width - 32),
            
            inputTextPassword.topAnchor.constraint(equalTo: inputTextLogin.bottomAnchor),
            inputTextPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextPassword.heightAnchor.constraint(equalToConstant: 50),
            inputTextPassword.widthAnchor.constraint(equalToConstant: view.frame.size.width - 32),
            

            buttonLogIn.topAnchor.constraint(equalTo: inputTextPassword.bottomAnchor, constant: 16),
            buttonLogIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.widthAnchor.constraint(equalToConstant: view.frame.size.width - 32),
            
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view1.rightAnchor.constraint(equalTo: view.rightAnchor),
            view1.topAnchor.constraint(equalTo: view.topAnchor),
           // view1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view1.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
