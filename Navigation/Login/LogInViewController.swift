

import UIKit

class LogInViewController: UIViewController {

        
    private let nc = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
// подключение Клавиатуры
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
//
    
    private func layout() {
        //[imageLogo,buttonLogIn,inputTextLogin,inputTextPassword,stackView].forEach {contentView.addSubview($0)}
        
        contentView.addSubview(imageLogo)
        contentView.addSubview(buttonLogIn)
        contentView.addSubview(inputTextLogin)
        contentView.addSubview(inputTextPassword)
        contentView.addSubview(stackView)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupConstraints()
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
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
        let bgImageNormal = UIImage(named: "blue_pixel")!.alpha(1)
        
        let imgSelected = UIImage(named: "blue_pixel")!.alpha(0.8)
        let imgHighligted = UIImage(named: "blue_pixel")!.alpha(0.8)
        let imgDesabled = UIImage(named: "blue_pixel")!.alpha(0.8)
        
        let logIn = UIButton()
        logIn.addTarget(self, action: #selector(pressedLogin), for: .touchUpInside)
        logIn.setBackgroundImage(bgImageNormal, for: .normal)
        logIn.setBackgroundImage(imgSelected, for: .selected)
        logIn.setBackgroundImage(imgHighligted, for: .highlighted)
        logIn.setBackgroundImage(imgDesabled, for: .disabled)
      
        
        logIn.setTitle("Log In", for: .normal)
        logIn.layer.cornerRadius = 10
        logIn.titleLabel?.textColor = .black
        logIn.translatesAutoresizingMaskIntoConstraints = false
        logIn.clipsToBounds = true
        return logIn
    }()
    @objc private func pressedLogin() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    private lazy var inputTextLogin: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email of phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor
        textField.indent(size: 10)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    private lazy var inputTextPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor
        textField.indent(size: 10)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        
        return textField
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [inputTextLogin, inputTextPassword])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.backgroundColor = .red
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.spacing = 10
        stackView.backgroundColor = .systemGray6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            inputTextLogin.topAnchor.constraint(equalTo: stackView.topAnchor),
            inputTextLogin.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            inputTextLogin.heightAnchor.constraint(equalToConstant: 50),
            inputTextLogin.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            inputTextLogin.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),

            inputTextPassword.topAnchor.constraint(equalTo: inputTextLogin.bottomAnchor),
            inputTextPassword.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            inputTextPassword.heightAnchor.constraint(equalToConstant: 50),
            inputTextPassword.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            inputTextPassword.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            stackView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            

            buttonLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            buttonLogIn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogIn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
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


// UIImage+Alpha.swift

extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
