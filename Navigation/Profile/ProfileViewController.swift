//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anton Utin on 09.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
       let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: view.bounds.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }

}
