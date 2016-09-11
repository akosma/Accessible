//
//  JSONLoader.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import Foundation
import GameplayKit

func loadJSON() -> [Customer] {
    let filename = "Data"
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return [Customer]()
    }
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0)) as? [[String: AnyObject]]
        let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: json!) as? [[String: AnyObject]]

        var results = [Customer]()
        for item in shuffled! {
            var customer = Customer()
            customer.name = item["name"] as! String
            customer.address = item["address"] as! String
            customer.zip = item["zip"] as! String
            customer.city = item["city"] as! String
            customer.country = item["country"] as! String
            customer.location = item["location"] as! String
            customer.age = item["age"] as! Int
            results.append(customer)
        }
        
        return results
    }
    catch {
        // Do nothing
    }
    return [Customer]()
}
