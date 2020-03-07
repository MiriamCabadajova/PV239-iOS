//
//  SliderViewController.swift
//  SecondAssignment
//
//  Created by Miriam Cabadajová on 07/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var sliderView: UIView!
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print(slider.value)
    }
}
