//
//  ViewController.swift
//  CocoaPodsExample
//
//  Created by SP07 on 10/5/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit
import SwiftLocation
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapOutlet: MKMapView!
    @IBOutlet weak var coordinatesLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.3376769, longitude: -122.02958965)
        mapOutlet.addAnnotation(annotation)
        mapOutlet.setCenter(annotation.coordinate, animated: true)
        
        let uilgr = UILongPressGestureRecognizer(target: self, action: #selector(MKMapView.addAnnotation(_:)))
        uilgr.minimumPressDuration = 1.0
        mapOutlet.addGestureRecognizer(uilgr)
        
        //Location.getLocation(accuracy: .navigation, frequency: .continuous, success: self.handleLocationSuccess, error: self.handleLocationError)
    }
    
    func addAnnotation(_ gestureRecognizer:UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: mapOutlet)
        let newCoordinates = mapOutlet.convert(touchPoint, toCoordinateFrom: mapOutlet)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapOutlet.addAnnotation(annotation)
    }

    func handleLocationSuccess(_ location: LocationRequest, _ coordinates: CLLocation) {
        mapOutlet.setCenter(coordinates.coordinate, animated: true)
        coordinatesLabel.text = "Latitude: " + coordinates.coordinate.latitude.description + " Longitude: " + coordinates.coordinate.longitude.description
    }
    
    func handleLocationError(_ request: LocationRequest, _ lastLocation: CLLocation? , _ error: Error) {
        print("Error")
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is PinAnnotation {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            
            pinAnnotationView.isDraggable = true
            pinAnnotationView.canShowCallout = true
            pinAnnotationView.animatesDrop = true
            
            return pinAnnotationView
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        if let annotation = view.annotation as? PinAnnotation {
            mapView.removeAnnotation(annotation)
        }
    }
}

