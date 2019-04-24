//
//  FoodListVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
class FoodListVC: UIViewController {

    let imgBackground = UIImageView()
    let categoryName = UIView()
    let categoryImage = UIImageView()
    let categoryLabel = UILabel()
    
    let FLTableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 120
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    let cellTableId = "cellTable"
    var arrayFoodTam = [FoodTemp]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let foodTemp = FoodTemp(img: "egg", name: "Món trứng hột vịt muối", kcal: "50 Kcal", plg: "P: 50g\tL: 20g\tG: 15g")
        
        for _ in 0...10 {
            arrayFoodTam.append(foodTemp)
        }
        setupView()
        FLTableView.dataSource = self
        FLTableView.delegate = self
        FLTableView.register(FoodListCell.self, forCellReuseIdentifier: cellTableId)
    }
    

}
extension FoodListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFoodTam.count
    }    
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "") { (action, view, completion) in
            self.arrayFoodTam.remove(at: indexPath.row)
            self.FLTableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(named: "icons8-trash")
        action.backgroundColor = FlatRed()
        
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: ""){(action, view, handler) in
            print("Edit Action Tapped")
        }
        edit.backgroundColor = UIColor.flatSkyBlue()
        edit.image = UIImage(named: "icons8-edit")
        let deleteSwipe = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [deleteSwipe, edit])
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableId, for: indexPath) as! FoodListCell
        cell.configFoodDetails(foodtemp: arrayFoodTam[indexPath.row])
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}
//class UIFLCell: UITableViewCell {
//
//    let cellImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "BitmapCơm")
//        return image
//    }()
//    let tableLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Cơm"
//        label.textColor = UIColor.black
//        label.font = UIFont(name: FONT, size: 17)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    func setupView(){
//        addSubview(cellImage)
//        addSubview(tableLabel)
//
////        cellImage.image = UIImage(named: "BitmapCơm")
//        
////        tableLabel.text = "Cơm"
////        tableLabel.textColor = UIColor.black
////        tableLabel.font = UIFont(name: FONT, size: 17)
//        
//        cellImage.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.8)
//        }
//
//        tableLabel.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.2)
//        }
//    }
//}
