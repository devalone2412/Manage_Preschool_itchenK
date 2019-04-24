//
//  UIAddFoodToMenu.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/23/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit

extension AddFoodToMenuVC {
    
    func setupView() {
        setupGeneral()
        setupNavController()
        addUIControls()
        setupConstraints()
    }
    
    func setupNavController() {
        self.navigationItem.titleView = menuView
        let addButton = UIBarButtonItem(title: "Thêm", style: .plain, target: self, action: #selector(addFoodBtnClicked))
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc func addFoodBtnClicked() {
        print("Clicked")
    }
    
    func setupGeneral() {
        view.backgroundColor = .white
    }
    
    func addUIControls() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
