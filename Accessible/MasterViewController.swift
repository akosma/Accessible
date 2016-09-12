//
//  MasterViewController.swift
//  Accessible
//
//  Created by Adrian on 11.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var customers = loadJSON()
    
//    override func viewDidLoad() {
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 44.0;
//        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
//    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Customers"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showForm" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let customer = customers[indexPath.row]
                let controller = segue.destination as! FormViewController
                controller.customer = customer
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = customers[indexPath.row]
        cell.textLabel?.text = object.name
        let completeAddress = "\(object.address) – \(object.zip) \(object.city)"
        cell.detailTextLabel?.text = completeAddress
        return cell
    }
}

