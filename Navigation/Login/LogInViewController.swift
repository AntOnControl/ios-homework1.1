//
//  LogInViewController.swift
//  Navigation
//
//  Created by Anton Utin on 09.06.2022.
//

import UIKit

class LogInViewController: UIViewController {

        
    private let nc = NotificationCenter.default
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func layout() {
        
        contentView.addSubview(imageLogo)
        contentView.addSubview(buttonLogIn)
        contentView.addSubview(inputTextLogin)
        contentView.addSubview(inputTextPassword)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupConstraints()
        //view.layer.addSublayer(subLayer) //тест слоев
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    
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
        textField.placeholder = "Email of phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        //textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        //textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private lazy var inputTextPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    /*
    private lazy var subLayer: CALayer = {
    subLayer.backgroundColor = UIColor.red.cgColor
    subLayer.shadowOffset = CGSize(width: 0.0, height: 0.3)
    subLayer.shadowRadius = 5.0
    subLayer.shadowOpacity = 0.8
    subLayer.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
    return subLayer
    }()
     */
 /*
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
   */
    
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
           // imageLogo.topAnchor.constraint(equalTo: (view1.centerYAnchor)),
           // imageLogo.topAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0.3),
           // imageLogo.topAnchor.constraint(equalTo: topAnchor, constant: 160),
           // imageLogo.topAnchor.constraint(equalTo: topAn, constant: 400),
            
            inputTextLogin.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            inputTextLogin.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            inputTextLogin.heightAnchor.constraint(equalToConstant: 50),
            inputTextLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            inputTextLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            inputTextPassword.topAnchor.constraint(equalTo: inputTextLogin.bottomAnchor),
            inputTextPassword.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            inputTextPassword.heightAnchor.constraint(equalToConstant: 50),
            inputTextPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            inputTextPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            

            buttonLogIn.topAnchor.constraint(equalTo: inputTextPassword.bottomAnchor, constant: 16),
            buttonLogIn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
    }
}

extension LogInViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
