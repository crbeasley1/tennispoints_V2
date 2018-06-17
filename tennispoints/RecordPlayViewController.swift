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
    @objc let locationManager = CLLocationManager()
    @objc let userID = Auth.auth().currentUser?.uid
    var duration: TimeInterval?
    @objc var startTime = Date()

    @IBAction func recordPlay(_ sender: Any) {
    //MARK: CHECK IF HOMECOURT AND CURRENT LOCATION IS THE SAME
    //MARK: CHECK IF THERE'S MORE THAN ONE COURT
    let beginPlay = startTime
    print(beginPlay)
        
        
    }


    @IBAction func stopButton(_ sender: Any) {
        //MEASURE TIME ELAPSED --CONVERT TO NUMBER
        let endTime = Date()
        let endPlay = endTime
        print(endPlay)
        let interval = endTime.timeIntervalSince(startTime)
        let tPoints = interval
        Database.database().reference().child(Auth.auth().currentUser!.uid).child("tPoints").setValue(tPoints)
        
        
    }

    

}


