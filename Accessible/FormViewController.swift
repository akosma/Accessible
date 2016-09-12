//
//  FormViewController.swift
//  Accessible
//
//  Created by Adrian on 12.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var zipField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    var customer: Customer?
    
    override func viewDidLoad() {
        if let customer = customer {
            self.title = customer.name
            nameField.text = customer.name
            addressField.text = customer.address
            zipField.text = customer.zip
            cityField.text = customer.city
            countryField.text = customer.country
            ageField.text = "\(customer.age)"
            favoriteSwitch.setOn(customer.favorite, animated: false)
        }
    }
    
    @IBAction func save(_ sender: AnyObject) {
        if !validate() {
            nameLabel.textColor = UIColor.red
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let controller = segue.destination as! MapViewController
            controller.customer = customer
        }
    }
    
    func validate() -> Bool {
        if nameField.text?.lengthOfBytes(using: .utf8) == 0 {
            return false
        }
        return true
    }
}
