
//
//  UITabBar.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/18/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit

extension TabBarVC {
    
    func setupTabBar() {
        let cs = CookingScheduleVC()
        let navController = UINavigationController(rootViewController: cs)
        let fm = FoodManagementVC()
        fm.title = "Quản lý món ăn"
        let im = InventoryManagementVC()
        im.title = "Quản lý kho"
        
        viewControllers = [navController,fm,im]
    }
    
    func customTabBarItem() {
        let tabItem1 = (tabBar.items?[0])! as UITabBarItem
        let tabItem2 = (tabBar.items?[1])! as UITabBarItem
        let tabItem3 = (tabBar.items?[2])! as UITabBarItem
        
        setupCustomTabBarItem(tabItem: tabItem1, unSelectedImage: "icons8-2008", selectedImage: "icons8-2008_filled", title: "Lịch nấu")
        setupCustomTabBarItem(tabItem: tabItem2, unSelectedImage: "icons8-sunny_side_up_eggs", selectedImage: "icons8-sunny_side_up_eggs_filled", title: "Quản lý món ăn")
        setupCustomTabBarItem(tabItem: tabItem3, unSelectedImage: "icons8-cardboard_box", selectedImage: "icons8-cardboard_box_filled", title: "Quản lý kho")
        
    }
    
    func setupCustomTabBarItem(tabItem: UITabBarItem, unSelectedImage: String, selectedImage: String, title: String) {
        
        tabItem.image = UIImage(named: unSelectedImage)?.withRenderingMode(.alwaysOriginal)
        tabItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        tabItem.title = title
    }
    
}
