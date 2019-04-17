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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        eventHandler()
        
        
    }
    
    func eventHandler() {
        
    }

}

extension LoginVC : UITextFieldDelegate {
    
}
