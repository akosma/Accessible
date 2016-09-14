//
//  FavoriteControl.swift
//  Accessible
//
//  Created by Adrian on 12.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

@IBDesignable class FavoriteControl: UIControl {

    @IBInspectable var selectedText : String = "★" {
        didSet {
            label.text = selectedText
        }
    }
    
    @IBInspectable var deselectedText : String = "☆" {
        didSet {
            label.text = deselectedText
        }
    }
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
    
    @IBInspectable var isOn : Bool = false {
        didSet {
            if isOn {
                label.text = selectedText
//                accessibilityValue = "Favorite customer"
            }
            else {
                label.text = deselectedText
//                accessibilityValue = "Not favorite customer"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLabel()
//        initAccessibility()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLabel()
//        initAccessibility()
    }
    
    func initLabel() {
        label.text = deselectedText
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40.0)
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
    }
    
//    func initAccessibility() {
//        isAccessibilityElement = true
//        accessibilityTraits = UIAccessibilityTraitButton
//        accessibilityLabel = "Favorite"
//        accessibilityValue = "Not favorite customer"
//    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isOn = !isOn
        sendActions(for: .valueChanged)
    }
    
    override func prepareForInterfaceBuilder() {
        initLabel()
        super.prepareForInterfaceBuilder()
    }
}
