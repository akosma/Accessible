//
//  JSONLoader.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import Foundation
import GameplayKit

func loadJSON() -> [[String: AnyObject]]? {
    let filename = "Data"
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0)) as? [[String: AnyObject]]
        let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: json!) as? [[String: AnyObject]]
        return shuffled
    }
    catch {
        // Do nothing
    }
    return nil
}
