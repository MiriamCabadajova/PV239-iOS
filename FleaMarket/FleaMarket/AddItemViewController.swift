//
//  AddItemViewController.swift
//  FleaMarket
//
//  Created by Miriam Cabadajová on 04/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    private var marketItem = MarketItem()
    var itemsListDelegate: ItemsListDelegate?
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func textLabelChanged(_ sender: UITextField) {
        print("textlabelchanged")
        marketItem.name = sender.text ?? "New Item"
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        marketItem.price = Int(round(slider.value))
        priceLabel.text = "\(marketItem.price)$"
    }
    
    @IBAction func sellButtonPressed(_ sender: UIButton) {
        itemsListDelegate?.addItem(item: marketItem)
        dismiss(animated: true, completion: nil)
    }
}
