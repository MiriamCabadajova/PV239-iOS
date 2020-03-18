//
//  DrawViewController.swift
//  ThirdAssignment
//
//  Created by Miriam Cabadajová on 15/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var drawButton: UIButton!
    
    private var drawnNumber = DrawnNumber()
    weak var numbersCollectionDelegate: NumbersCollectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawButton.layer.cornerRadius = 5.0
    }
    
    
    @IBAction func segmentedControlIndexSelected(_ segmentedControl: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            drawnNumber.color = UIColor(named: "customRed") ?? UIColor.red
        case 1:
            drawnNumber.color = UIColor(named: "customBlue") ?? UIColor.blue
        case 2:
            drawnNumber.color = UIColor(named: "customGreen") ?? UIColor.green
        default:
            print("Unexpected behaviour, using default values.")
        }
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            drawnNumber.number = Int.random(in: 1...10)
        case 1:
            drawnNumber.number = Int.random(in: 11...49)
        case 2:
            drawnNumber.number = Int.random(in: 1...50)
        default:
            print("Unexpected behaviour, using default values.")
        }
        
        numbersCollectionDelegate?.add(item: drawnNumber)
        dismiss(animated: true, completion: nil)
        
    }
}


