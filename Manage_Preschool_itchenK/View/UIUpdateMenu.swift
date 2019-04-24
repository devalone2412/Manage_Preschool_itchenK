//
//  UIUpdateMenu.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit

extension UpdateMenuVC {
    
    func setupView() {
        setupGeneral()
        setupUIControls()
        setupNavController()
        addUIControls()
        setupConstraints()
    }
    
    func setupNavController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNavBtnClicked))
    }
    
    @objc func addNavBtnClicked() {
        let addFoodVC = AddFoodToMenuVC()
        navigationController?.pushViewController(addFoodVC, animated: true)
    }
    
    func setupGeneral() {
        title = "Cập nhật thực đơn"
        view.backgroundColor = .white
    }
    
    func setupUIControls() {
        setupDateLbl()
        setupMealLbl()
    }
    
    func setupDateLbl() {
        dateLbl.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        dateLbl.text = "1/4/2019"
        dateLbl.textAlignment = .center
    }
    
    func setupMealLbl() {
        mealLbl.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        mealLbl.text = "Bữa sáng"
        mealLbl.textAlignment = .center
    }
    
    func addUIControls() {
        view.addSubview(dateLbl)
        view.addSubview(mealLbl)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        dateLbl.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        mealLbl.snp.makeConstraints { (make) in
            make.top.equalTo(dateLbl).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(mealLbl.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
