//
//  PinAnnotation.swift
//  CocoaPodsExample
//
//  Created by SP07 on 11/5/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class PinAnnotation: NSObject, MKAnnotation {
    
    private var coord: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return coord
        }
    }
    
    var title: String? = ""
    var subtitle: String? = ""
    
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        self.coord = newCoordinate
    }
}

