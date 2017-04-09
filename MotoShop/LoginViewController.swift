//
//  LoginViewController.swift
//  MotoShop
//
//  Created by Admin on 09.04.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginFacebook: UIButton!
    @IBOutlet weak var logoutFacebook: UIButton!
    
    var loginSuccess = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if FBSDKAccessToken.current() != nil {
            logoutFacebook.isHidden = true
            FacebookManager.getUserData(completion: { 
                self.loginFacebook.setTitle("Continue as \(String(describing: User.currentUser.email!))", for: .normal)
            })
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if FBSDKAccessToken.current() != nil && loginSuccess == true {
            performSegue(withIdentifier: "ClientView", sender: self)
        }
    }
    
    @IBAction func facebookLogoutButton(_ sender: UIButton) {
        FacebookManager.shared.logOut()
        User.currentUser.resetUser()
        logoutFacebook.isHidden = true
        loginFacebook.setTitle("Login with Facebook", for: .normal)
    }
    
    @IBAction func facebookLoginButton(_ sender: UIButton) {
        
        if FBSDKAccessToken.current() != nil {
            self.loginSuccess = true
            self.viewDidAppear(true)
        } else {
            
            FacebookManager.shared.logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: { (result, error) in
                
                if error != nil {
                    print(error!)
                } else {
                    
                    FacebookManager.getUserData(completion: { 
                        self.loginSuccess = true
                        self.viewDidAppear(true)
                    })
                    
                }
                
            })
        }
    }

}
