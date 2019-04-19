//
//  UICalendarPicker.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/19/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

extension CalendarPickerVC {
    
    func setupView() {
        setupGeneral()
        addUIControls()
        setupUIControls()
        setupConstraints()
    }
    
    func setupGeneral() {
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        print("Đã hiện màn hình")
    }
    
    func addUIControls() {
        view.addSubview(calendarView)
    }
    
    func setupUIControls() {
        setupCalendarView()
    }
    
    func setupCalendarView() {
        calendarView.backgroundColor = FlatBlack()
    }
    
    func setupConstraints() {
        setupCalendarViewConstraints()
    }
    
    func setupCalendarViewConstraints() {
        calendarView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }
    
}
