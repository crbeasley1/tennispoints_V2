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
import MapKit


class SetCourtViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //MARK: PROPERTIES AND OUTLETS
    
 var locationManager : CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        determineMyCurrentLocation()
    
    }
    
     func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    
    
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        
    }
        
    
   
    @IBAction func setCourt(_ sender: Any) {
        
    
        
            Database.database().reference().child(Auth.auth().currentUser!.uid).child("textField?.text").setValue(["Latitude": self.locationManager.location!.coordinate.latitude, "Longitude": self.locationManager.location!.coordinate.longitude])
        
    }
}
