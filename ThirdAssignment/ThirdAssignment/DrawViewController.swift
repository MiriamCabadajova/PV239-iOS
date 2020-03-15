//
//  DrawViewController.swift
//  ThirdAssignment
//
//  Created by Miriam Cabadajová on 15/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit


class DrawViewController: UIViewController {
    
    @IBOutlet weak var drawButton: UIButton!
    
    
    private var drawnNumber = DrawnNumber()
    var numbersCollectionDelegate: NumbersCollectionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        //najskor nahodne vyberiem farbu
        //potom nahodne vyberiem cislo podla tej danej farby
        
        
        //1 for red, 2 for blue and 3 for green
        let randomColor = Int.random(in: 1...3)
        
        switch randomColor {
        case 1:
            drawnNumber.color = UIColor.red
            drawnNumber.number = Int.random(in: 1...10)
        case 2:
            drawnNumber.color = UIColor.blue
            drawnNumber.number = Int.random(in: 11...49)
        case 3:
            drawnNumber.color = UIColor.green
            drawnNumber.number = Int.random(in: 1...50)
        
        default:
            print("Unexpected behaviour")
        }
        numbersCollectionDelegate?.add(item: drawnNumber)
        dismiss(animated: true, completion: nil)
        
    }
    
    
}


