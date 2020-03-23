//
//  NumbersCollectionViewController.swift
//  ThirdAssignment
//
//  Created by Miriam Cabadajová on 15/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

protocol NumbersCollectionDelegate: class {
    func add(item: DrawnNumber)
}

let ADD_NUMBER_SEGUE_ID = "addNumberSegueID"
class NumbersCollectionViewController: UIViewController {
    
    private var numbers = [DrawnNumber]()
    
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numbersCollectionView.dataSource = self
        numbersCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == ADD_NUMBER_SEGUE_ID,
            let addItemController = segue.destination as? DrawViewController
        {
            addItemController.numbersCollectionDelegate = self
        }
    }
}

extension NumbersCollectionViewController: NumbersCollectionDelegate {
    func add(item: DrawnNumber) {
        numbers.append(item)
        numbersCollectionView.reloadData()
    }
}

let CELL_REUSE_ID = "cellReuseID"

extension NumbersCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_REUSE_ID, for: indexPath) as? NumberCell else {
            return UICollectionViewCell()
        }
        cell.isUserInteractionEnabled = true
        let number = numbers[indexPath.item]
        cell.numberLabel.text = "\(number.number)"
        cell.numberLabel.textColor = number.color
        cell.layer.cornerRadius = cell.frame.size.width/2
        cell.clipsToBounds = true
        return cell
    }
    
}

extension NumbersCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isUserInteractionEnabled = false
        cell?.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 2.0, initialSpringVelocity: 5.0, options: [.curveEaseOut], animations: {
                    cell?.transform = .identity
        }) { (completed) in
            self.numbers.remove(at: indexPath.row)
            self.numbersCollectionView.reloadData()
            
        }

    }
}


