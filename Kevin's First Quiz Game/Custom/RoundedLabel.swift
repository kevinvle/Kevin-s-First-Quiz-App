//
//  RoundedLabel.swift
//  Kevin's First Quiz Game
//
//  Created by Kevin Le on 11/30/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        // All this does is round edges by 5 pixels
    }
    
    override func drawText(in rect: CGRect) {
        let newRect = rect.insetBy(dx: 8.0, dy: 8.0)        // Give text in our label some padding so it doesn't stick to the edges
        super.drawText(in: newRect)
    }
    
}
