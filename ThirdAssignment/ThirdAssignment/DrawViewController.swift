//
//  DrawViewController.swift
//  ThirdAssignment
//
//  Created by Miriam Cabadajová on 15/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit
import Alamofire

class DrawViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var topTextLabel: UILabel!
    
    
    private var drawnNumber = DrawnNumber()
    weak var numbersCollectionDelegate: NumbersCollectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawButton.layer.cornerRadius = 5.0
        activityIndicator.isHidden = true
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
        enableUserInteraction(value: false)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            requestRandomNumberInterval(minVal: 1, maxVal: 10)
        case 1:
            requestRandomNumberInterval(minVal: 11, maxVal: 49)
        case 2:
            requestRandomNumberInterval(minVal: 1, maxVal: 50)
        default:
            print("Unexpected behaviour, using default values.")
        }
        
    }
    
    private func enableUserInteraction(value: Bool) {
        drawButton.isUserInteractionEnabled = value
        segmentedControl.isUserInteractionEnabled = value
        activityIndicator.isHidden = value
        
        if value {
            drawButton.backgroundColor = UIColor(named: "backgroundColor")
            topTextLabel.textColor = UIColor(named: "backgroundColor")
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        } else {
            drawButton.backgroundColor = UIColor(named: "disabledColor")
            topTextLabel.textColor = UIColor(named: "disabledColor")
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        }
    }
}

extension DrawViewController {
    
    private func requestRandomNumberInterval(minVal: Int, maxVal: Int) {
        AF.request("https://www.random.org/integers/?num=1&min=\(minVal)&max=\(maxVal)&base=10&format=plain&col=1").responseJSON { response in
            switch response.result {
            case .success(_):
                if let responseVal = response.value as? Int {
                    self.drawnNumber.number = responseVal
                    self.numbersCollectionDelegate?.add(item: self.drawnNumber)
                    self.dismiss(animated: true, completion: nil)
                }
            case .failure(let error):
                self.enableUserInteraction(value: true)
                
                let alert = UIAlertController(title: "Request unsuccessful", message: error.errorDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
}

