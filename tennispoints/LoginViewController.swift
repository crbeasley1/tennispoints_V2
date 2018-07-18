//
//  LoginViewController.swift
//  tennispoints
//
//  Created by Chip on 1/20/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        Auth.auth().addStateDidChangeListener() { auth, user in
            // 2
            if user != nil {
                // 3
                self.performSegue(withIdentifier: "profile", sender: nil)
            }
        }
    }
    

    
    @IBAction func signIn(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, Error) in
                if Error == nil {
                    //perform segue
                    self.performSegue(withIdentifier: "profile", sender: nil)
                }
                else {
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            let alert = UIAlertController(title: "Oh No!", message: "Are you sure you have the right username/password?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                                NSLog("The \"OK\" alert occured.")
                            }))
                            self.present(alert, animated: true, completion: nil)
                            
                            
                            print("Wrong Username/Password")
                            
                        }
                        else {
                            //perform segue
                            self.performSegue(withIdentifier: "profile", sender: nil)
                        }
                    }
                }
                
                
            }
            
            
            
        }
        
        

    }
    
}
