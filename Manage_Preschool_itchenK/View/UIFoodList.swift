//
//  UIFoodList.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

extension FoodListVC {
    func setupView() {
        configNavController()
        addUIControls()
        setupGeneral()
        setupUIControls()
        setupConstraints()
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
    
    func addUIControls(){
        view.addSubview(imgBackground)
        view.addSubview(categoryName)
        categoryName.addSubview(categoryImage)
        categoryName.addSubview(categoryLabel)
        view.addSubview(FLTableView)
    }
    func setupUIControls() {
        setupImgBackground()
        setupCategoryName()
        setupCategoryImage()
        setupCategoryLabel()
    }
    
    func setupImgBackground(){
        imgBackground.image = UIImage(named: IMGBACKGROUND)
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupCategoryName(){
        
        categoryName.backgroundColor = UIColor.white
        categoryName.layer.cornerRadius = 20
        categoryName.layer.masksToBounds = true
    }
    
    func setupCategoryImage(){
        categoryImage.image = UIImage(named: "BitmapCơm")
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupCategoryLabel(){
        categoryLabel.font = UIFont(name: "AvenirNext-Medium", size: 17)
        categoryLabel.textColor = UIColor.black
        categoryLabel.textAlignment = .center
        categoryLabel.text = "Cơm"
    }
    
    func setupConstraints(){
        setupCategoryNameConstraints()
        setupCategoryImageConstraints()
        setupCategoryLabelConstraints()
        setupFLTableViewConstraints()
        setupImgBackgroundConstraints()
    }
    
    func setupCategoryNameConstraints(){
        
        categoryName.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.27)
            make.width.equalToSuperview().multipliedBy(0.35)
        }
    }
    
    func setupCategoryImageConstraints(){
        categoryImage.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    func setupCategoryLabelConstraints(){
        categoryLabel.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }
    
    func setupFLTableViewConstraints(){
        FLTableView.snp.makeConstraints { (make) in
            make.top.equalTo(categoryName.snp.bottom).offset(35)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupImgBackgroundConstraints(){
        imgBackground.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupGeneral(){
        view.backgroundColor = UIColor.white
    }
}
