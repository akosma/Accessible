//
//  Customer.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit
import CoreLocation

struct Customer {
    var name = ""
    var address = ""
    var age = 0
    var zip = ""
    var city = ""
    var country = ""
    var favorite = false
    var location = CLLocationCoordinate2D(latitude: 0, longitude: 0)
}

extension Customer {
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
            let address = json["address"] as? String,
            let age = json["age"] as? Int,
            let zip = json["zip"] as? String,
            let city = json["city"] as? String,
            let country = json["country"] as? String,
            let location = json["location"] as? String
            else {
                return nil
        }
        
        self.name = name
        self.address = address
        self.age = age
        self.zip = zip
        self.city = city
        self.country = country
        self.favorite = false
        
        let coords = location.components(separatedBy: ", ")
        if let lat = Double(coords[0]), let long = Double(coords[1]) {
            self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        }
    }
}
