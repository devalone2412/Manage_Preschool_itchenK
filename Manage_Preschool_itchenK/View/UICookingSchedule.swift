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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuTapped))
    }
    
    @objc func menuTapped() {
        let distanceRightSide = view.frame.size.width - view.frame.size.width * 0.4
        if isShow {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.menuView.frame.origin.x += distanceRightSide
            })
            imageCustomer.layer.cornerRadius = imageCustomer.frame.size.width / 2
            self.isShow = false
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.menuView.frame.origin.x -= distanceRightSide
            })
            self.isShow = true
        }
    }
    
    @objc func buttonSignOutPressed() {
        let loginVC = LoginVC()
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
    }
    
    func setupUIControls() {
        setupDowSegmentedControl()
        setupWeekButton()
        setupInfoButton()
    }
    
    func setupInfoButton() {
        infoButton.setImage(UIImage(named: "icons8-info"), for: .normal)
    }
    
    func setupWeekButton() {
        weekButton.setImage(UIImage(named: "icons8-calendar"), for: .normal)
        weekButton.backgroundColor = UIColor.white
        weekButton.layer.cornerRadius = 5
    }
    
    func setupDowSegmentedControl() {
        dowSegmentedControl.selectedSegmentIndex = 0
        dowSegmentedControl.layer.cornerRadius = 5
        let attr = NSDictionary(object: UIFont(name: "AvenirNext-Medium", size: 15)!, forKey: NSAttributedString.Key.font as NSCopying)
        dowSegmentedControl.setTitleTextAttributes((attr as [NSObject : AnyObject] as [NSObject : AnyObject] as! [NSAttributedString.Key : Any]), for: .normal)
        
    }
    
    func addUIControls() {
        view.addSubview(dowSegmentedControl)
        view.addSubview(weekButton)
        view.addSubview(infoButton)
        view.addSubview(calendarCollectionView)
        view.addSubview(menuView)
        menuView.addSubview(imageCustomer)
    }
    
    func setupConstraints() {
        setupDowSegmentedControlConstraints()
        setupWeekButtonConstraints()
        setupInfoButtonConstraints()
        setupCalendarCollectionViewConstraints()
        setupMenuViewConstraints()
        setupImageCustomerConstraints()
    }
    
    func setupImageCustomerConstraints() {
        imageCustomer.snp.makeConstraints { (make) in
            make.size.equalTo(menuView.snp.width).multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
    }
    
    func setupMenuViewConstraints() {
        menuView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.right.equalTo(view.snp.left).offset(0)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupCalendarCollectionViewConstraints() {
        calendarCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(weekButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupInfoButtonConstraints() {
        infoButton.snp.makeConstraints { (make) in
            make.right.equalTo(dowSegmentedControl.snp.right)
            make.centerY.equalTo(weekButton.snp.centerY)
            make.size.equalTo(weekButton.snp.size).multipliedBy(0.8)
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
