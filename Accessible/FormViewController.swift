//
//  FormViewController.swift
//  Accessible
//
//  Created by Adrian on 12.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
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
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var fields: [UITextField]!
    
    var customer: Customer?
    let errorPrefix = "* "
    
    override func viewDidLoad() {
        if let customer = customer {
            self.title = customer.name
            nameField.text = customer.name
            addressField.text = customer.address
            zipField.text = customer.zip
            cityField.text = customer.city
            countryField.text = customer.country
            ageField.text = "\(customer.age)"
            favoriteSwitch.isOn = customer.favorite
        }
    }
    
    @IBAction func save(_ sender: AnyObject) {
        validate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let controller = segue.destination as! MapViewController
            controller.customer = customer
        }
    }
    
    func validate() {
        var counter = 0
        var errors = 0
        for field in fields {
            let label = labels[counter]
            if field.text?.lengthOfBytes(using: .utf8) == 0 {
                label.textColor = .red
                
//                let font = UIFont.preferredFont(forTextStyle: .body)
//                label.font = UIFont.boldSystemFont(ofSize: font.pointSize)
//                
//                if let text = label.text,
//                    !text.hasPrefix(errorPrefix) {
//                    label.text = "\(errorPrefix)\(text)"
//                }
//                errors += 1
            }
            else {
                label.textColor = .black

//                let font = UIFont.preferredFont(forTextStyle: .body)
//                label.font = UIFont.systemFont(ofSize: font.pointSize)
//
//                if let text = label.text,
//                    text.hasPrefix(errorPrefix) {
//                    let index = text.index(text.startIndex, offsetBy: 2)
//                    label.text = text.substring(from: index)
//                }
            }
            counter += 1
        }
        errorLabel.isHidden = errors == 0
    }
}

extension FormViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        validate()
    }
}
