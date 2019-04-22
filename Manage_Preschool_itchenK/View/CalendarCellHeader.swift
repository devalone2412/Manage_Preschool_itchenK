//
//  FoodCellHeader.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit

class CalendarCellHeader: UICollectionReusableView {
    
    let meal: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: FONT, size: 17)
        lb.textAlignment = .left
        return lb
    }()
    
    let buttonModify: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "edit"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupConstraints()
    }
    
    func setup() {
//        backgroundColor = .black
        addSubview(meal)
        addSubview(buttonModify)
    }
    
    func setupConstraints() {
        meal.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        buttonModify.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.1)
        }
    }
    
    func configCalendarHeader(mealText: String) {
        meal.text = mealText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
