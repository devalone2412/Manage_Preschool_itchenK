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
        addUIControls()
        setupUIControls()
        setupConstraints()
        setupGeneral()
    }
    
    func setupGeneral() {
        title = "Quản lý thức ăn"
    }
    
    func addUIControls() {
        view.addSubview(imgBackground)
        view.addSubview(blurView)
    }
    
    func setupUIControls() {
        setupImageBackground()
        setupBlurView()
    }
    
    func setupImageBackground() {
        imgBackground.image = UIImage(named: IMGBACKGROUND)
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupBlurView() {
        blurView.effect = blurEffect
        blurView.alpha=0.93
        blurView.frame = view.bounds
    }
    
    func setupConstraints() {
        setupImageBackgroundConstraints()
        setupBlurViewConstraints()
    }
    
    func setupImageBackgroundConstraints() {
        imgBackground.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setupBlurViewConstraints(){
        blurView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
