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
        setupGeneral()
        addUIControls()
        setupUIControls()
        setupConstraints()
    }
    
    func setupUIControls() {
        setupBackgroundImage()
    }
    
    func setupBackgroundImage() {
        backgroundImage.image = UIImage(named: IMGBACKGROUND)
    }
    
    func addUIControls() {
        view.addSubview(backgroundImage)
    }
    
    func setupGeneral() {
        title = "Lịch nấu"
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
