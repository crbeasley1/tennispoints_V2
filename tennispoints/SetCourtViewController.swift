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
    
    var locationManager = CLLocationManager()
    var camera = MKMapCamera()
    
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
  
    
    
    @IBOutlet weak var courView: MKMapView!
    
    
    
    
    @IBAction func addHomeCourt(_ sender: Any) {
        
        // MARK: DATABASE REFERENCE
        let db = Database.database().reference().childByAutoId().child("usercourts")
        
        
        // MARK: Create the alert controller.
        let alert = UIAlertController(title: "Court Name", message: "Enter your court Name", preferredStyle: .alert)
        
        // MARK: Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
        }
        
        // MARK: Grab the value from the text field, and print it when the user clicks OK.
        // MARK: GET LOCATION OF COURT
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            // Force unwrapping because we know it exists.
            print("Text field: \(textField?.text)")
            db.setValue(textField?.text)
            self.setupCoreLocation()
            // SET CURRENT LOCATION AS THE USER'S HOME COURT
            self.setLocationAsHomeCourt()
            
            
            
        }))
        
        // MARK: Present the alert.
        self.present(alert, animated: true, completion: nil)
        }
    
    //MARK: LOCATION FUNCTIONS
    
    func setupCoreLocation(){
        switch CLLocationManager.authorizationStatus() {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            enableLocationServices()
        default:
            break
            }
    }
    
    func enableLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
        locationManager.startUpdatingLocation()
            print("We're updating, bitch")
        
        
        }
        
        }
        
    func disableLocationServices() {
        locationManager.stopUpdatingLocation()

        
        }
    
    
    func setLocationAsHomeCourt() {
        let mapView = courView
        let userLocationCoordinates = CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!)
        let homeCourtPin = CourtPin(coordinate: userLocationCoordinates, title: "My HomeCourt", subtitle: "Court No.")
            mapView?.addAnnotation(homeCourtPin)
        
            mapView?.addAnnotation(homeCourtPin)
            mapView?.showAnnotations([homeCourtPin], animated: true)
            camera.centerCoordinate = userLocationCoordinates
            camera.altitude = 50.0
        
        //STORE AS AN ARRAY OF COURTS???
        let db = Database.database().reference().childByAutoId().child("CourtLocation")
            print("We threw down a pin, bitch")
            print(db)
        //COMPLETION HANDLER FOR SEGUE HERE
        //self.performSegue(withIdentifier: "goToPro", sender: nil)

    }
    
    
        //MARK: Location Manager delegates
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .authorizedWhenInUse:
                print("authorized")
            case .denied, .restricted:
                print("not authorized")
            default:
                break
            
            
            }
    }
    
    
    
    }



