//
//  RoundedButton.swift
//  Kevin's First Quiz Game
//
//  Created by Kevin Le on 11/30/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        // All this does is round edges by 5 pixels
    }
    
}
