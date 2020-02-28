//
//  UsefulViewController.swift
//  MyUsefulApp
//
//  Created by Miriam Cabadajová on 26/02/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class UsefulViewController: UIViewController {

    var counter = 0
    
    @IBOutlet weak var clickTextLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var clickMeButton: UIButton!
    
    override func viewDidLoad() {
        clickMeButton.clipsToBounds = true
        clickMeButton.layer.cornerRadius = 15.0
        clickMeButton.layer.borderWidth = 3.0
        clickMeButton.layer.borderColor = UIColor(named: "customOrange")?.cgColor
        
    }
    @IBAction func buttonClickHandler(_ sender: UIButton) {
        
        counter += 1
        numberLabel.text = "\(counter)"
        
        if counter == 1 {
            clickTextLabel.text = "click"
        } else {
            clickTextLabel.text = "clicks"
        }
        
    }
    
}

