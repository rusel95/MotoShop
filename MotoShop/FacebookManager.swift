//
//  FacebookManager.swift
//  MotoShop
//
//  Created by Admin on 09.04.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SwiftyJSON

class FacebookManager {

    static let shared = FBSDKLoginManager()
    
    public class func  getUserData(completion: @escaping () -> Void) {
        if FBSDKAccessToken.current() != nil {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email,picture.type(normal)"]).start(completionHandler: { (connection, result, error) in
                if error == nil {
                    let json = JSON(result!)
                    print(json)
                    completion()
                }
            })
        }
    }
}
