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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
    }
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        
        
}
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
        mapView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Court"
        annotation.subtitle = "current location"
        mapView.addAnnotation(annotation)
        
        manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        
    }
        
    
   
    @IBAction func setCourt(_ sender: Any) {
        
        let alert = UIAlertController(title: "Court Name", message: "Enter your court Name", preferredStyle: .alert)
        alert.addTextField { (textField) in
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            // Force unwrapping because we know it exists.
            print("Text field: \(String(describing: textField?.text))")
        
            Database.database().reference().child(Auth.auth().currentUser!.uid).child((textField?.text)!).setValue(["Latitude": self.locationManager.location!.coordinate.latitude, "Longitude": self.locationManager.location!.coordinate.longitude])
            

        }

        )
        
        )
        
        self.present(alert, animated: true, completion: nil)

    }
        
    
        
        
        
        
        
    }

