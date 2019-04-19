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
    let weekButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        eventHandler()
    }
    
    func eventHandler() {
        weekButtonHandler()
    }
    
    func weekButtonHandler() {
        weekButton.addTarget(self, action: #selector(weekButtonTapped), for: .touchUpInside)
    }
    
    @objc func weekButtonTapped() {
        let calendarPickerVC = CalendarPickerVC()
        calendarPickerVC.modalTransitionStyle = .crossDissolve
        calendarPickerVC.modalPresentationStyle = .overCurrentContext
        self.present(calendarPickerVC, animated: true, completion: nil)
    }

}
