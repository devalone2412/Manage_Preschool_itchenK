//
//  TabBarVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/18/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    func setupTabBar() {
        let cs = CookingScheduleVC()
        cs.title = "Lịch nấu"
        let fm = FoodManagementVC()
        fm.title = "Quản lý món ăn"
        let im = InventoryManagementVC()
        im.title = "Quản lý kho"
        
        viewControllers = [cs,fm,im]
        
    }

}
