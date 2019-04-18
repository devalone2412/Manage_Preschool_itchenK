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
    
    // MARK: Thay đổi màu thanh status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Hàm setupView liên kết với LoginVC
    func setupView() {
        addUIControls()
        setupUIControls()
        setupConstraints()
    }
    
    // MARK: Hàm thêm các UIControls vào view
    func addUIControls() {
        view.addSubview(imgBackground)
        view.addSubview(viewBox)
        viewBox.addSubview(imageLogo)
        viewBox.addSubview(stackView)
        stackView.addArrangedSubview(tfEmployeeCode)
        stackView.addArrangedSubview(tfPassword)
        viewBox.addSubview(buttonSignIn)
    }
    
    // MARK: Hàm thiết lập các thuộc tính của các UIControls
    func setupUIControls() {
        setupImageBackground()
        setupViewBox()
        setupImageLogo()
        setupStackView()
        setupTfEmployeeCode()
        setupTfPassword()
        setupButtonSignIn()
    }
    
    func setupButtonSignIn() {
        buttonSignIn.backgroundColor = UIColor.flatSkyBlue()
        buttonSignIn.setTitle("Đăng nhập", for: .normal)
        buttonSignIn.setTitleColor(UIColor(contrastingBlackOrWhiteColorOn: FlatSkyBlue(), isFlat: true), for: .normal)
        buttonSignIn.layer.cornerRadius = 10
        buttonSignIn.titleLabel?.font = UIFont(name: FONT, size: 17)
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setPaddingTextField() -> UIView {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.tfEmployeeCode.frame.height))
        return paddingView
    }
    
    func setupGeneralTextField(tf: UITextField) {
        tf.layer.cornerRadius = 10
        tf.backgroundColor = UIColor.flatWhite()
        tf.leftView = setPaddingTextField()
        tf.leftViewMode = .always
        tf.font = UIFont(name: FONT, size: 17)
        tf.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTfPassword() {
        setupGeneralTextField(tf: tfPassword)
        tfPassword.tag = 1
        tfPassword.placeholder = "Mật khẩu"
        tfPassword.isSecureTextEntry = true
        tfPassword.returnKeyType = UIReturnKeyType.go
    }
    
    func setupTfEmployeeCode() {
        tfEmployeeCode.tag = 0
        setupGeneralTextField(tf: tfEmployeeCode)
        tfEmployeeCode.placeholder = "Mã nhân viên"
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 27
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupImageLogo() {
        imageLogo.image = UIImage(named: LOGO)
        imageLogo.contentMode = .scaleToFill
        imageLogo.layer.cornerRadius = 20
        imageLogo.layer.masksToBounds = true
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViewBox() {
        viewBox.backgroundColor = UIColor.flatBlack()?.withAlphaComponent(0.7)
        viewBox.layer.cornerRadius = view.frame.width * 0.03
        viewBox.layer.shadowOffset = CGSize(width: -5, height: 5)
        viewBox.layer.shadowRadius = 5
        viewBox.layer.shadowOpacity = 0.5
        viewBox.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupImageBackground() {
        imgBackground.image = UIImage(named: IMGBACKGROUND)
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Hàm thiết lập các ràng buộc của các UIControls trên view
    func setupConstraints() {
        setupImageBackgroundConstraints()
        setupViewBoxConstraints()
        setupImageLogoConstraints()
        setupStackViewConstraints()
        setupTfEmployeeCodeConstraints()
        setupButtonSignInConstraints()
    }
    
    func setupButtonSignInConstraints() {
        buttonSignIn.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(30)
            make.centerX.equalTo(viewBox)
            make.width.equalTo(stackView.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
    
    func setupTfEmployeeCodeConstraints() {
        tfEmployeeCode.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    }
    
    func setupStackViewConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualTo(imageLogo.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    func setupImageLogoConstraints() {
        imageLogo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(37)
            make.size.lessThanOrEqualTo(110)
        }
    }
    
    func setupImageBackgroundConstraints() {
        imgBackground.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupViewBoxConstraints() {
        viewBox.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.75)
            make.bottom.equalTo(buttonSignIn.snp.bottom).offset(20)
        }
    }
    
}
