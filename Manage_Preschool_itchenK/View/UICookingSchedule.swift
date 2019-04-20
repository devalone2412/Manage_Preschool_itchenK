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
        setupBlackBackground()
        setupButtonInsidePopup()
    }
    
    func setupButtonInsidePopup() {
        buttonInsidePopup.backgroundColor = FlatSkyBlue()
        buttonInsidePopup.setTitle("Hiển thị", for: .normal)
        buttonInsidePopup.setTitleColor(UIColor(contrastingBlackOrWhiteColorOn: FlatSkyBlue(), isFlat: true), for: .normal)
        buttonInsidePopup.titleLabel?.font = UIFont(name: FONT, size: 17)
    }
    
    func setupBlackBackground() {
        popupView.backgroundColor = FlatWhite()
        popupView.layer.cornerRadius = 10
        popupView.isHidden = true
        popupView.clipsToBounds = true
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
        view.addSubview(popupView)
        popupView.addSubview(buttonInsidePopup)
    }
    
    func setupConstraints() {
        setupDowSegmentedControlConstraints()
        setupWeekButtonConstraints()
        setupBlackBackgroundConstraints()
        setupButtonInsidePopupConstraints()
    }
    
    func setupButtonInsidePopupConstraints() {
        buttonInsidePopup.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
    
    func setupBlackBackgroundConstraints() {
        popupView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
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
