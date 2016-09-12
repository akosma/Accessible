//
//  FavoriteControl.swift
//  Accessible
//
//  Created by Adrian on 12.09.16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class FavoriteControl: UIControl {

    let blackStar = "★"
    let whiteStar = "☆"
    let label = UILabel()
    
    var isOn = false {
        didSet {
            if isOn {
                label.text = blackStar
                accessibilityValue = "Favorite customer"
            }
            else {
                label.text = whiteStar
                accessibilityValue = "Not favorite customer"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLabel()
        initAccessibility()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLabel()
        initAccessibility()
    }
    
    func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        label.text = whiteStar
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        
        let font = UIFont.systemFont(ofSize: 40.0)
        label.font = font
    }
    
    func initAccessibility() {
        isAccessibilityElement = true
        accessibilityTraits = UIAccessibilityTraitButton
        accessibilityLabel = "Favorite"
        accessibilityValue = "Not favorite customer"
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addSubview(label)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isOn = !isOn
        sendActions(for: .valueChanged)
    }
}
