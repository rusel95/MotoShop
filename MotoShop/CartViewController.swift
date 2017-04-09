//
//  CartViewController.swift
//  MotoShop
//
//  Created by Admin on 09.04.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit
import SWRevealViewController

class CartViewController: UIViewController {

    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
