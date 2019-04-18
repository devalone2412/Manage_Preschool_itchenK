//
//  cooking schedule cooking schedule cooking schedule Cooking ScheduleVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/17/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit

class CookingScheduleVC: UIViewController {

    // Initialize variables
    let daysOfWeek: Array<String> = ["Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6"]
    
    // Initialize UIControls
    lazy var dowSegmentedControl: UISegmentedControl = UISegmentedControl(items: daysOfWeek)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

}
