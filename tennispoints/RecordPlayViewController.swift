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
    var duration: TimeInterval?
    let startTime = Date()

    @IBAction func recordPlay(_ sender: Any) {
    //MARK: CHECK IF HOMECOURT AND CURRENT LOCATION IS THE SAME
    //MARK: CHECK IF THERE'S MORE THAN ONE COURT
    //start updating location
    let beginPlay = startTime
        print(beginPlay)
        
        
    }


    @IBAction func stopButton(_ sender: Any) {
        //MEASURE TIME ELAPSED --CONVERT TO NUMBER
        let endTime = Date()

        let endPlay = endTime
        print(endPlay)
        let interval = endTime.timeIntervalSince(startTime)
        //let tPoints = interval
        let ref = Database.database().reference().childByAutoId().child("TennisPoints")
        ref.setValue(interval)
    }

    

}


