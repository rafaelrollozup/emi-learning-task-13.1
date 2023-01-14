//
//  PurchaseSettingsViewController.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 19/07/2022.
//

import UIKit

class PurchaseSettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movieSession: Session!
    
    var menuItems: [MenuItem] = MenuItem.allCases
    var itemActiveIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
    }
    
    func setupViews() {
        tableView.tableHeaderView = PurchaseSettingsTableHeaderView.build(from: movieSession)
    }

}

extension PurchaseSettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseSettingsMenuItemCell", for: indexPath) as? PurchaseSettingsMenuItemCell else {
            fatalError("Não foi possível recuperar uma celula para o item de menu em Purchase Settings")
        }
        
        cell.menuItem = menuItems[indexPath.row]
        cell.active = indexPath.row == itemActiveIndex
        return cell
    }

}
