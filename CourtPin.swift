//
//  CourtPin.swift
//  tennispoints
//
//  Created by Chip on 3/27/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit
import CoreLocation
import MapKit

class CourtPin: NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    @objc init(coordinate:CLLocationCoordinate2D,title:String?,subtitle:String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }


}


