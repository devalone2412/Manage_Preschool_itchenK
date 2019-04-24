//
//  AddFoodToMenuVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/23/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
import BTNavigationDropdownMenu

class AddFoodToMenuVC: UIViewController {
    
    
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
    let itemsCategory = ["Cơm", "Xôi", "Cháo", "Món sợi", "Lẩu", "Món nem, cuốn", "Nộm (gỏi)", "Các món thịt", "Các món muối", "Các món rau", "Canh", "Bánh, mứt, kẹo"]
    lazy var menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.title("Category"), items: self.itemsCategory)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let foodTemp = FoodTemp(img: "egg", name: "Món trứng hột vịt muối", kcal: "50 Kcal", plg: "P: 50g\tL: 20g\tG: 15g")
        
        for _ in 0...10 {
            arrayFoodTam.append(foodTemp)
        }
        
        setupView()
        setupMenuNav()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodDetailsCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func setupMenuNav() {
        menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
        }
        
        menuView.cellSeparatorColor = UIColor(contrastingBlackOrWhiteColorOn: FlatSkyBlue(), isFlat: true)
        menuView.cellTextLabelColor = UIColor(contrastingBlackOrWhiteColorOn: FlatSkyBlue(), isFlat: true)
        menuView.cellTextLabelFont = UIFont(name: "AvenirNext-DemiBold", size: 17)
        menuView.cellBackgroundColor = FlatSkyBlue()
        menuView.cellSelectionColor = .white
        menuView.arrowImage = UIImage(named: "expand-arrow")
        menuView.arrowTintColor = .black
    }
    
}

extension AddFoodToMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFoodTam.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FoodDetailsCell
        cell.configFoodDetails(foodtemp: arrayFoodTam[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
}
