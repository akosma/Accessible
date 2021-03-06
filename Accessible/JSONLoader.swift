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
    var results = [Customer]()
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return results
    }
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]]
        let random = GKRandomSource.sharedRandom()
        if let shuffled = random.arrayByShufflingObjects(in: json!) as? [[String: AnyObject]] {
            shuffled.forEach { item in
                if let customer = Customer(json: item) {
                    results.append(customer)
                }
            }
        }
        
        return results
    }
    catch {
        // Do nothing, which is not a good idea, but well, such is life.
    }
    return results
}
