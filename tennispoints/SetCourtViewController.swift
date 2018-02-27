//
//  SetCourtViewController.swift
//  tennispoints
//
//  Created by Chip on 1/29/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import Firebase
import UIKit
import CoreLocation
import FirebaseDatabase


class SetCourtViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
        
    
    
    
    
    @IBAction func addHomeCourt(_ sender: Any) {
        
        let db = Database.database().reference().child("usercourts").child("courtone")
        db.setValue("courtone")
        
        // Do any additional setup after loading the view, typically from a nib.
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Court Name", message: "Enter your court Name", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            // Force unwrapping because we know it exists.
            print("Text field: \(textField?.text)")
            db.setValue(textField?.text)
            
            
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
     
           }
    
    
    }


