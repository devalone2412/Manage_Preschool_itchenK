//
//  UIFoodManagement.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/16/19.
//  Copyright © 2019 Vinh Trần. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

extension FoodManagementVC {
    
    func setupView() {
        configNavController()
        addUIControls()
        setupUIControls()
        setupConstraints()
        setupGeneral()
    }
    
    func configNavController(){
        navigationItem.title = "Quản lý món ăn"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-exit"), style: .plain, target: self, action: #selector(buttonSignOutPressed))
    }
    
    @objc func buttonSignOutPressed(){
        let loginVC = LoginVC()
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
    }
    
    
    
    func addUIControls() {
        //view.addSubview(imgBackground)
        //view.addSubview(blurView)
    }
    
    func setupUIControls() {
        //setupImageBackground()
        //setupBlurView()

    }
    
    
    func setupConstraints() {
        
    }
    
    func setupGeneral(){
        view.backgroundColor = UIColor.white
    }
}
