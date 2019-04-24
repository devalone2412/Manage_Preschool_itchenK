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
    let meal = ["Buổi sáng", "Buổi trưa", "Buổi tối"]
    weak var tipView: EasyTipView?
    let calendarCellId = "mainCell"
    let headerId = "Header"
    var isShow = true
    
    // Initialize UIControls
    lazy var dowSegmentedControl: UISegmentedControl = UISegmentedControl(items: daysOfWeek)
    let weekButton: UIButton = UIButton(type: .system)
    let infoButton: UIButton = UIButton(type: .system)
    var preferences = EasyTipView.Preferences()
    let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    // --------------------------------------------
    let menuView: UIView = {
        let v = UIView()
        v.backgroundColor = FlatSkyBlue()
        return v
    }()
    
    let imageCustomer: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .center
        iv.backgroundColor = FlatWhite()
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        iv.image = UIImage(named: "user")
        iv.clipsToBounds = true
        return iv
    }()
    
    // --------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        eventHandler()
        setupEasyTipView()
        setupCalendarCollectionViewDelegate()
    }
    
    func setupCalendarCollectionViewDelegate() {
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.register(CalendarCell.self, forCellWithReuseIdentifier: calendarCellId)
        calendarCollectionView.showsVerticalScrollIndicator = false
        calendarCollectionView.register(CalendarCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func setupEasyTipView() {
        preferences.drawing.font = UIFont(name: "AvenirNext-Bold", size: 13)!
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
        comps.day = 30
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
    
    func showDetailsFood() {
        let showDetailsFood = ShowDetailsFoodVC()
        navigationController?.pushViewController(showDetailsFood, animated: true)
    }

}

// MARK: Extension liên quan UICollectionView

extension CookingScheduleVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarCellId, for: indexPath) as! CalendarCell
        cell.cs = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: ((view.frame.height) / 3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 8, bottom: 0, right: 8)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = calendarCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! CalendarCellHeader
            headerView.configCalendarHeader(mealText: meal[indexPath.section])
            headerView.cs = self
            return headerView
        }
        
        return CalendarCellHeader()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: calendarCollectionView.frame.width, height: 25)
    }
}
