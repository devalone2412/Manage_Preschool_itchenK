//
//  LoginVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/15/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // Initialize UIControls
    let imgBackground = UIImageView()
    let viewBox = UIView()
    let imageLogo = UIImageView()
    let tfEmployeeCode = UITextField()
    let tfPassword = UITextField()
    let stackView = UIStackView()
    let buttonSignIn = UIButton(type: .system)
    
    
    // Variable
    var defaultPositiontViewY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        eventHandler()
        configUIControls()
    }
    
    func configUIControls() {
        configTextField()
        configTapGesture()
    }
    
    func configTextField() {
        tfPassword.delegate = self
        tfEmployeeCode.delegate = self
        defaultPositiontViewY = view.frame.origin.y
    }
    
    func configTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = self.defaultPositiontViewY
        }
    }
    
    func eventHandler() {
        buttonSignIn.addTarget(self, action: #selector(buttonSignInTapped), for: .touchUpInside)
    }
    
    @objc func buttonSignInTapped() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = self.defaultPositiontViewY
        }
        
        let tabVC = TabBarVC()
        present(tabVC, animated: true, completion: nil)
    }
    
}

extension LoginVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            view.frame.origin.y = defaultPositiontViewY
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = -120
            self.view.layoutIfNeeded()
        }
    }
    
}
