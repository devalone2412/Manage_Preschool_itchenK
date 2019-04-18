//
//  FoodManagementVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/16/19.
//  Copyright © 2019 Vinh Trần. All rights reserved.
//

import UIKit


class FoodManagementVC: UIViewController {

    let imgBackground = UIImageView()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    let blurView = UIVisualEffectView()
    let topViewBox = UIView()
    let signOut = UIImageView()
    let add = UIImageView()
    let tfDashBoard = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        eventHandler()
    }

    func eventHandler() {
        print("456")
    }

}
