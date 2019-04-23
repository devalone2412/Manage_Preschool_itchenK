//
//  UpdateMenuVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import ChameleonFramework

class UpdateMenuVC: UIViewController {

    let dateLbl = UILabel()
    let mealLbl = UILabel()
    let tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 120
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    var arrayFoodTam = [FoodTemp]()
    
    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let foodTemp = FoodTemp(img: "egg", name: "Món trứng hột vịt muối", kcal: "50 Kcal", plg: "P: 50g\tL: 20g\tG: 15g")
        
        for _ in 0...10 {
            arrayFoodTam.append(foodTemp)
        }
        
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodDetailsCell.self, forCellReuseIdentifier: cellId)
    }

}

extension UpdateMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFoodTam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FoodDetailsCell
        cell.configFoodDetails(foodtemp: arrayFoodTam[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "") { (action, view, completion) in
            self.arrayFoodTam.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(named: "icons8-trash")
        action.backgroundColor = FlatRed()
        
        return action
    }
}
