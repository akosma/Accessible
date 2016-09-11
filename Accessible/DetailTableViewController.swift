//
//  DetailTableViewController.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var customer: [String: AnyObject]?
    
    @IBOutlet weak var nameCell: UITableViewCell!
    @IBOutlet weak var addressCell: UITableViewCell!
    @IBOutlet weak var zipCell: UITableViewCell!
    @IBOutlet weak var cityCell: UITableViewCell!
    @IBOutlet weak var countryCell: UITableViewCell!
    @IBOutlet weak var ageCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = customer?["name"] as? String
        nameCell.detailTextLabel?.text = customer?["name"] as? String
        addressCell.detailTextLabel?.text = customer?["address"] as? String
        zipCell.detailTextLabel?.text = customer?["zip"] as? String
        cityCell.detailTextLabel?.text = customer?["city"] as? String
        countryCell.detailTextLabel?.text = customer?["country"] as? String
        ageCell.detailTextLabel?.text = "\(customer?["age"] as! Int)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let controller = segue.destination as! MapViewController
            controller.customer = customer
        }
    }
}
