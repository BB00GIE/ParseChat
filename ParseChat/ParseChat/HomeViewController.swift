//
//  HomeViewController.swift
//  ParseChat
//
//  Created by Brandon Elmore on 2/17/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logout(_ sender: Any) {
        PFUser.logOutInBackground { (Error) in
            if let error = Error{
                print(error.localizedDescription)
            }else {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
}
