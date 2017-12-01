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
        
        // Drawing code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
