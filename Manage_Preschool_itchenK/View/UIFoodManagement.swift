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
        configNavController()
        addUIControls()
        setupGeneral()
        setupUIControls()
        setupConstraints()
        
    }
    
    func configNavController(){
        navigationItem.title = "Quản lý món ăn"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-exit"), style: .plain, target: self, action: #selector(buttonSignOutPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-plus_math_filled"), style: .plain, target: self, action: #selector(buttonAddPressed))
    }
    
    @objc func buttonSignOutPressed(){
        let loginVC = LoginVC()
        loginVC.modalTransitionStyle = .crossDissolve
        present(loginVC, animated: true, completion: nil)
    }
    
    @objc func buttonAddPressed(){
        
    }
    
    func addUIControls() {
        //view.addSubview(imgBackground)
        //view.addSubview(blurView)
        //view.addSubview(FMCollectionView)
    }
    
    func setupUIControls() {
        //setupImageBackground()
        //setupBlurView()
        //setupCollectionView()
    }
    
    
    func setupConstraints() {
        //setupCollectionViewConstraints()
    }
    
    func setupCollectionView(){
        //FMCollectionView.backgroundColor=UIColor.black
        //FMCollectionView.numberOfItems(inSection: 2)
    }
    
    func setupCollectionViewConstraints(){
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 60, height: 60)
//        let FMCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    }
    
    func setupGeneral(){
        view.backgroundColor = UIColor.white
    }
    
}
