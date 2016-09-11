//
//  DetailTableViewController.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var customer: Customer?
    
    @IBOutlet weak var nameCell: UITableViewCell!
    @IBOutlet weak var addressCell: UITableViewCell!
    @IBOutlet weak var zipCell: UITableViewCell!
    @IBOutlet weak var cityCell: UITableViewCell!
    @IBOutlet weak var countryCell: UITableViewCell!
    @IBOutlet weak var ageCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = customer?.name
        nameCell.detailTextLabel?.text = customer?.name
        addressCell.detailTextLabel?.text = customer?.address
        zipCell.detailTextLabel?.text = customer?.zip
        cityCell.detailTextLabel?.text = customer?.city
        countryCell.detailTextLabel?.text = customer?.country
        ageCell.detailTextLabel?.text = "\(customer!.age)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let controller = segue.destination as! MapViewController
            controller.customer = customer
        }
    }
}
