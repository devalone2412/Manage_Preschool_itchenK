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
        setupGeneral()
        setupUIControls()
        setupConstraints()
        
    }
    
    func configNavController(){
        navigationItem.title = "Quản lý món ăn"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-exit"), style: .plain, target: self, action: #selector(buttonSignOutPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-plus_math_filled"), style: .plain, target: self, action: #selector(buttonAddPressed))
    }
    
    @objc func buttonSignOutPressed(){
        let loginVC = LoginVC()
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
    }
    
    @objc func buttonAddPressed(){
        
    }
    
    func addUIControls() {
        view.addSubview(imgBackground)
        view.addSubview(blurView)
    }
    
    func setupUIControls() {
        setupImgBackground()
        setupBlurView()
    }
    
    func setupImgBackground(){
        imgBackground.image = UIImage(named: IMGBACKGROUND)
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupBlurView(){
    }
    
    func setupConstraints() {
        setupImgBackgroundConstraints()
    }
    
    func setupImgBackgroundConstraints(){
        imgBackground.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupGeneral(){
        view.backgroundColor = UIColor.white
    }
    
}
