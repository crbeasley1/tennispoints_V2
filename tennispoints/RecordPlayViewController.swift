//
//  RecordPlayViewController.swift
//  tennispoints
//
//  Created by Chip on 1/29/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import CoreLocation
import FirebaseDatabase

class RecordPlayViewController: UIViewController {

    //MARK PROPERTIES AND OUTLETS
    let locationManager = CLLocationManager()
    let userID = Auth.auth().currentUser?.uid
    var duration: TimeInterval?
    var startTime = Date()
    let calendar = Calendar.current
    var isOn = false
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func recordPlay(_ sender: Any) {
    //MARK: CHECK IF HOMECOURT AND CURRENT LOCATION IS THE SAME
    //MARK: CHECK IF THERE'S MORE THAN ONE COURT
     
        
        if isOn == false {
            (sender as AnyObject).setTitle("Stop", for: .normal)
            isOn = true
            let beginPlay = startTime
            //change to current time???
            print(beginPlay)
        } else {
            isOn = false
            (sender as AnyObject).setTitle("Record", for: .normal)
            let endTime = Date()
            let endPlay = endTime
            print(endPlay)
            let interval = endTime.timeIntervalSince(startTime)
            let tPoints = interval
            Database.database().reference().child(Auth.auth().currentUser!.uid).child("tPoints").setValue(tPoints)
            print("Points Added")

        }
        
            
        }
        
    
        
        
    }


    




