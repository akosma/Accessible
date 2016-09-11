//
//  MapViewController.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var customer: [String: AnyObject]?

    override func viewWillAppear(_ animated: Bool) {
        let location = customer?["location"] as? String
        let coords = location?.components(separatedBy: ", ")
        let lat = Double((coords?[0])!)!
        let long = Double((coords?[1])!)!
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapView.centerCoordinate = coordinate
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = customer?["name"] as? String
        mapView.addAnnotation(annotation)
    }
}
