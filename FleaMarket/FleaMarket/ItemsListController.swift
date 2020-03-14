//
//  ItemsListController.swift
//  FleaMarket
//
//  Created by Miriam Cabadajová on 14/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

protocol ItemsListDelegate: class {
    func addItem(item: MarketItem)
}

private let ADD_ITEM_SEGUE = "addItemSegue"
class ItemsListController: UIViewController {
    private var itemsList = [MarketItem]()
    @IBOutlet weak var itemsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsListTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == ADD_ITEM_SEGUE,
            let addItemController = segue.destination as? AddItemViewController {
                addItemController.itemsListDelegate = self
        }
    }
    
}

extension ItemsListController: ItemsListDelegate {
    func addItem(item: MarketItem) {
        itemsList.append(item)
        itemsListTableView.insertRows(at: [IndexPath(row: itemsList.count - 1, section: 0)], with: .automatic)
    }
}
private let CELL_REUSABLE_ID = "reusableCellID"
extension ItemsListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_REUSABLE_ID, for: indexPath)
        
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemsList.remove(at: indexPath.row)
            itemsListTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension ItemsListController: UITableViewDelegate {
    
}
