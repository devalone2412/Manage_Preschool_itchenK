//
//  UICookingSchedule.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/17/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

extension CookingScheduleVC {
    
    func setupView() {
        configNavController()
        setupUIControls()
        addUIControls()
        setupConstraints()
        setupGeneral()
    }
    
    func configNavController() {
        navigationItem.title = "Lịch nấu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-exit"), style: .plain, target: self, action: #selector(buttonSignOutPressed))
    }
    
    @objc func buttonSignOutPressed() {
        let loginVC = LoginVC()
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
    }
    
    func setupUIControls() {
        setupDowSegmentedControl()
        setupWeekButton()
    }
    
    func setupWeekButton() {
        weekButton.setImage(UIImage(named: "icons8-calendar"), for: .normal)
        weekButton.backgroundColor = UIColor.white
        weekButton.layer.cornerRadius = 5
    }
    
    func setupDowSegmentedControl() {
        dowSegmentedControl.selectedSegmentIndex = 0
        dowSegmentedControl.layer.cornerRadius = 5
    }
    
    func addUIControls() {
        view.addSubview(dowSegmentedControl)
        view.addSubview(weekButton)
    }
    
    func setupConstraints() {
        setupDowSegmentedControlConstraints()
        setupWeekButtonConstraints()
    }
    
    func setupWeekButtonConstraints() {
        weekButton.snp.makeConstraints { (make) in
            make.top.equalTo(dowSegmentedControl.snp.bottom).offset(20)
            make.left.equalTo(dowSegmentedControl.snp.left)
            make.size.equalTo(dowSegmentedControl.snp.width).multipliedBy(0.1)
        }
    }
    
    func setupDowSegmentedControlConstraints() {
        dowSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
    }
    
    func setupGeneral() {
        view.backgroundColor = UIColor.white
    }
    
}
