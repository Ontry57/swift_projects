//
//  ProfileViewController.swift
//  VKapp
//
//  Created by Marat on 17.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelProfile: UILabel!
    @IBOutlet weak var viewShadow: DesignableView!
    
    var currentUser: [CurrentUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLogin()
        imageProfile.frame.size.width = 300
        imageProfile.frame.size.height = 300
        imageProfile.image =  UIImage.init(named: currentUser[0].avatar)
        imageProfile.layer.cornerRadius = 150
        viewShadow.layer.cornerRadius = 150

        labelProfile.text = currentUser[0].name
        
        
    }
    private func userLogin () {
        let curUser = CurrentUser(name: "Andrei", age: 28, avatar: "m2")
        currentUser.append(curUser)
    }
    
//    
//    @IBAction func buttonLogoutPressed(_ sender: UIButton) {
//        let LoginScreen = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
//        
//    }
}


