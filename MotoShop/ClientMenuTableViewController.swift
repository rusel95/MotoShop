//
//  ClientMenuTableViewController.swift
//  MotoShop
//
//  Created by Admin on 09.04.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ClientMenuTableViewController: UITableViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = User.currentUser.name
        avatarImage.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureURL!)!))
        avatarImage.layer.cornerRadius = 20.0
        avatarImage.layer.borderWidth = 3.0
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderColor = UIColor.white.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClientLogout" {
            FacebookManager.shared.logOut()
            User.currentUser.resetUser()
        }
    }

    
}
