//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Brandon Elmore on 2/17/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkForUser()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if (UsernameField.text!.isEmpty || PasswordField.text!.isEmpty) {
                   let alertController = UIAlertController(title: "Invalid Entry", message: "Please fill in the username and password", preferredStyle: .alert)
                   
                   // create a cancel action
                   let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                       // handle cancel response here. Doing nothing will dismiss the view.
                   }
                   // add the cancel action to the alertController
                   alertController.addAction(cancelAction)

                   // create an OK action
                   let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                       // handle response here.
                   }
                   // add the OK action to the alert controller
                   alertController.addAction(OKAction)
                   
                   present(alertController, animated: true) {
                       // optional code for what happens after the alert controller has finished presenting
                   }
               }
        registerUser()
        
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if (UsernameField.text!.isEmpty || PasswordField.text!.isEmpty) {
            let alertController = UIAlertController(title: "Invalid Entry", message: "Please fill in the username and password", preferredStyle: .alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)

            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        loginUser()
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
        
    }
    
    func loginUser() {

       let username = UsernameField.text ?? ""
       let password = PasswordField.text ?? ""

       PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
              print("User log in failed: \(error.localizedDescription)")
            } else {
              print("User logged in successfully")
              // display view controller that needs to shown after successful login
            }
         }
    }
    
    func registerUser() {
        let newUser = PFUser()
        newUser.username = UsernameField.text
        newUser.password = PasswordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
             if let error = error {
                 print(error.localizedDescription)
             } else {
                 print("User Registered successfully")

                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                 // manually segue to logged in view
             }
         }
    }
    
    func checkForUser(){
        if PFUser.current() != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
}
