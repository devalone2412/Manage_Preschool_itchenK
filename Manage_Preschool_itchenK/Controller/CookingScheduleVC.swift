//
//  cooking schedule cooking schedule cooking schedule Cooking ScheduleVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/17/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import DatePickerDialog
import EasyTipView
import ChameleonFramework

class CookingScheduleVC: UIViewController, EasyTipViewDelegate {
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        print("\(tipView) did dismiss!")
    }
    

    // Initialize variables
    let daysOfWeek: Array<String> = ["Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6"]
    weak var tipView: EasyTipView?
    
    // Initialize UIControls
    lazy var dowSegmentedControl: UISegmentedControl = UISegmentedControl(items: daysOfWeek)
    let weekButton: UIButton = UIButton(type: .system)
    let infoButton: UIButton = UIButton(type: .system)
    var preferences = EasyTipView.Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        eventHandler()
        
        setupEasyTipView()
    }
    
    func setupEasyTipView() {
        preferences.drawing.font = UIFont(name: FONT, size: 13)!
        preferences.drawing.foregroundColor = UIColor(contrastingBlackOrWhiteColorOn:FlatSkyBlue(), isFlat: true )
        preferences.drawing.backgroundColor = FlatSkyBlue()
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.bottom
        EasyTipView.globalPreferences = preferences
    }
    
    func eventHandler() {
        weekButtonHandler()
        infoButtonHandler()
    }
    
    func infoButtonHandler() {
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
    }
    
    @objc func infoButtonTapped() {
        if let tipView = tipView {
            tipView.dismiss {
                print("Completion called!")
            }
        } else {
            let text = "50 Kcal\tP: 10g\tL: 20g\tG: 30g"
            
            let tip = EasyTipView(text: text, preferences: preferences, delegate: self)
            tip.show(forView: infoButton)
            tipView = tip
        }
    }
    
    func weekButtonHandler() {
        weekButton.addTarget(self, action: #selector(weekButtonTapped), for: .touchUpInside)
    }
    
    @objc func weekButtonTapped() {
        
        let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.year = 0
        let maxDate = calendar.date(byAdding: comps, to: Date())
        comps.day = -30
        let minDate = calendar.date(byAdding: comps, to: Date())
        
        DatePickerDialog().show("Vui lòng chọn ngày", doneButtonTitle: "Hiển thị", cancelButtonTitle: "Huỷ", defaultDate: Date(), minimumDate: minDate, maximumDate: maxDate, datePickerMode: .date) { (date) in
            guard let date = date else { return }
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            print(formatter.string(from: date))
            
//            let calendar = Calendar.current
//            let today = calendar.startOfDay(for: Date())
//            let dayOfWeek = calendar.component(.weekday, from: today)
//            let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
//            let days = (weekdays.lowerBound ..< weekdays.upperBound)
//                .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }  // use `flatMap` in Xcode versions before 9.3
//                .filter { !calendar.isDateInWeekend($0) }
//            print(calendar)
//            print(today)
//            print(dayOfWeek)
//            print(weekdays)
//            print(days)
//            for i in days {
//                print(i)
//            }
            let weekDay = calendar.component(.weekOfYear, from: date)
            print(weekDay)
        }
    }

}
