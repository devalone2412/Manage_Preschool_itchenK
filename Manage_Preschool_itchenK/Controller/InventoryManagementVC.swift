//
//  InventoryManagementVCViewController.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/17/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
class InventoryManagementVC: UIViewController {

    let imgBackground = UIImageView()
    let IMTableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 120
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    let cellIMId = "cellTable"
    var arrayIngreTam = [IngreTemp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ingreTemp = IngreTemp(img: "beef", name: "Thịt bò", kcal: "50 Kcal", plg: "P: 50g\tL: 20g\tG: 15g")
        
        for _ in 0...10 {
            arrayIngreTam.append(ingreTemp)
        }
        setupView()
        
//        IMTableView.dataSource = self
//        IMTableView.delegate = self
//        IMTableView.register(IMCell.self, forCellReuseIdentifier: cellIMId)
//        tabBarController?.tabBar.isHidden = true
    }
    
    
}
//extension InventoryManagementVC: UITableViewDelegate, UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayIngreTam.count
//    }
//
//    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
//        let action = UIContextualAction(style: .destructive, title: "") { (action, view, completion) in
//            self.arrayIngreTam.remove(at: indexPath.row)
//            self.IMTableView.deleteRows(at: [indexPath], with: .automatic)
//            completion(true)
//        }
//        action.image = UIImage(named: "icons8-trash")
//        action.backgroundColor = FlatRed()
//
//        return action
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let edit = UIContextualAction(style: .normal, title: ""){(action, view, handler) in
//            print("Edit Action Tapped")
//        }
//        edit.backgroundColor = UIColor.flatSkyBlue()
//        edit.image = UIImage(named: "icons8-edit")
//        let deleteSwipe = deleteAction(at: indexPath)
//        return UISwipeActionsConfiguration(actions: [deleteSwipe, edit])
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIMId, for: indexPath) as! IMCell
//        cell.configFoodDetails(ingretemp: arrayIngreTam[indexPath.row])
//        cell.backgroundColor = UIColor.clear
//        return cell
//    }
//
//}
