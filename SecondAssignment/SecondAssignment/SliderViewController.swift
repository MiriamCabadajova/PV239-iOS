//
//  SliderViewController.swift
//  SecondAssignment
//
//  Created by Miriam Cabadajová on 08/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var modifiableView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    //@IBAction func sliderMoved(_ slider: UISlider) {
        
        //height.constant = CGFloat(Int(round(slider.value)))
    //}
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        height.constant = CGFloat(Int(round(sender.value)))
    }
}
