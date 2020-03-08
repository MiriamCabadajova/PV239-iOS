//
//  SliderViewController.swift
//  SecondAssignment
//
//  Created by Miriam Cabadajová on 08/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var height: NSLayoutConstraint!
    //
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        height.constant = CGFloat(Int(round(sender.value)))
        
    }
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBAction func sliderMoved(_ sender: UISlider) {
        heightConstraint.constant = CGFloat(Int(round(sender.value)))
    }
}
