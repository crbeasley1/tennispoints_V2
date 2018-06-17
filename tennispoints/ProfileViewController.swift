//
//  profileViewController.swift
//  tennispoints
//
//  Created by Chip on 1/21/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit
import CoreLocation

class ProfileViewController: UIViewController, CLLocationManagerDelegate {
    
    //mark properties and outlets
    
    
    
    @IBOutlet weak var tennisPointsDisplay: UILabel!
    

    override func viewWillAppear(_ animated: Bool) {
        
        tennisPointsDisplay.text = ("100")
        
      
    }
    

    @IBAction func signOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.performSegue(withIdentifier: "goToLogin", sender: nil)
    }




}
