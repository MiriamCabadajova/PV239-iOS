//
//  SliderViewController.swift
//  SecondAssignment
//
//  Created by Miriam Cabadajová on 08/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        heightConstraint.constant = CGFloat(sender.value)
    }
}
