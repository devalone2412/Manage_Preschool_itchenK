//
//  UILogin.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/15/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

extension LoginVC {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupView() {
        addUIControls()
        setupUIControls()
        setupConstraints()
    }
    
    func addUIControls() {
        view.addSubview(imgBackground)
        view.addSubview(viewBox)
        viewBox.addSubview(imageLogo)
    }
    
    func setupUIControls() {
        setupImageBackground()
        setupViewBox()
        setupImageLogo()
    }
    
    func setupImageLogo() {
        imageLogo.image = UIImage(named: <#T##String#>)
    }
    
    func setupViewBox() {
        viewBox.backgroundColor = UIColor(hexString: "#000", withAlpha: 0.5)
        viewBox.layer.cornerRadius = view.frame.width * 0.1
        viewBox.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupImageBackground() {
        imgBackground.image = UIImage(named: "imgBackground")
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        setupImageBackgroundConstraints()
        setupViewBoxConstraints()
    }
    
    func setupImageBackgroundConstraints() {
        imgBackground.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupViewBoxConstraints() {
        viewBox.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(view.snp.height).multipliedBy(0.6)
        }
    }
    
}
