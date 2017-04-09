//
//  User.swift
//  MotoShop
//
//  Created by Admin on 09.04.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var name: String?
    var email: String?
    var pictureURL: String?
    
    static let currentUser = User()
    
    func setUser(_ json: JSON) {
        self.name = json["name"].string
        self.email = json["email"].string
        
        let image = json["picture"].dictionary
        let imageData = image?["data"]?.dictionary
        self.pictureURL = imageData?["url"]?.string
    }
    
    func resetUser() {
        self.name = nil
        self.email = nil
        self.pictureURL = nil
    }
}
