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
    
    var locationManager: CLLocationManager!
    


    override func viewWillAppear(_ animated: Bool) {
        
      
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
