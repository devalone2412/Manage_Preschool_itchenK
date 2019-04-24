//
//  UIInventoryManagement.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/17/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

extension InventoryManagementVC {
    
    func setupView() {
        configNavController()
        addUIControls()
        setupUIControls()
    }
    
    func configNavController(){
        navigationItem.title = "DS Món ăn"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-back_filled"), style: .plain, target: self, action: #selector(buttonBackPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-plus_math_filled"), style: .plain, target: self, action: #selector(buttonAddPressed))
    }
    
    @objc func buttonBackPressed(){
        let FMVC = FoodManagementVC()
        FMVC.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(FMVC, animated: true)
    }
    
    @objc func buttonAddPressed(){
        
    }
    
    func addUIControls() {
        view.addSubview(imgBackground)
        view.addSubview(IMTableView)
    }
    
    func setupUIControls() {
        setupImgBackground()
    }
    
    func setupImgBackground(){
        imgBackground.image = UIImage(named: IMGBACKGROUND)
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        setupImgBackgroundConstraints()
        setupIMTableViewConstraints()
    }
    
    func setupImgBackgroundConstraints(){
        imgBackground.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupIMTableViewConstraints(){
        IMTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
