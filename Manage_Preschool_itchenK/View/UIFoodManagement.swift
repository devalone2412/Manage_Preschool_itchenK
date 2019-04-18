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
    }
    
    func addUIControls() {
        view.addSubview(imgBackground)
        view.addSubview(blurView)
        view.addSubview(topViewBox)
        topViewBox.addSubview(signOut)
        topViewBox.addSubview(add)
        topViewBox.addSubview(tfDashBoard)
    }
    
    func setupUIControls() {
        setupImageBackground()
        setupBlurView()
        setupTopViewBox()
        setupSignOut()
        setupAdd()
        setupTfDashBoard()
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
    
    func setupTopViewBox(){
        topViewBox.backgroundColor = UIColor.white
        topViewBox.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSignOut(){
        signOut.image = UIImage(named: SIGNOUT)
        signOut.tintColor = UIColor.black
    }
    
    func setupAdd(){
        add.image = UIImage(named: ADD)
        add.tintColor = UIColor.black
    }
    
    func setupTfDashBoard(){
        tfDashBoard.text = "QUẢN LÝ MÓN ĂN"
        tfDashBoard.textColor = UIColor.black
        tfDashBoard.font = UIFont(name: FONT, size: 15)
        tfDashBoard.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        setupImageBackgroundConstraints()
        setupBlurViewConstraints()
        setupTopViewBoxConstraints()
        setupSignOutConstraints()
        setupAddConstraints()
        setupTfDashBoardConstraints()
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
    func setupTopViewBoxConstraints(){
        topViewBox.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(0.088)
        }
    }
    
    func setupSignOutConstraints(){
        signOut.snp.makeConstraints {(make) in
            make.top.equalToSuperview().offset(25)
            make.left.equalToSuperview().offset(17)
        }
    }
    
    func setupAddConstraints(){
        add.snp.makeConstraints {(make) in
            make.top.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-17)
        }
    }
    
    func setupTfDashBoardConstraints() {
        tfDashBoard.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
        }
    }
}
