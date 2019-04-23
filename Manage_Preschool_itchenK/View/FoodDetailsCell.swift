//
//  FoodDetailsCell.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit

class FoodDetailsCell: UITableViewCell {

    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
//        v.layer.masksToBounds = true
        v.layer.shadowOffset = CGSize(width: -2, height: 2)
        v.layer.shadowOpacity = 0.7
        v.layer.shadowColor = UIColor.black.cgColor
//        v.layer.borderWidth = 2
        return v
    }()
    
    let imgFood: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.backgroundColor = .gray
        return iv
    }()
    
    let nameLbl = UILabel()
    let kcalLbl = UILabel()
    let plgLbl = UILabel()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [nameLbl, kcalLbl, plgLbl])
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.axis = .vertical
        return sv
    }()
    
    let cellId = "cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellId)
        
        setupView()
        setupLbl(lbl: nameLbl)
        setupLbl(lbl: kcalLbl)
        setupLbl(lbl: plgLbl)
        setupContraints()
    }
    
    func setupLbl(lbl: UILabel) {
        lbl.font = UIFont(name: "AvenirNext-Medium", size: 13)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.textColor = .black
    }
    
    func setupView() {
//        backgroundColor = .blue
        layer.masksToBounds = true
        selectionStyle = .none
        addSubview(bgView)
        addSubview(imgFood)
        addSubview(stackView)
    }
    
    func setupContraints() {
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        imgFood.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(bgView).inset(5)
            make.width.equalTo(bgView.snp.height).multipliedBy(0.9)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(bgView).inset(10)
            make.left.equalTo(imgFood.snp.right).offset(10)
        }
    }
    
    func configFoodDetails(foodtemp: FoodTemp) {
        imgFood.image = UIImage(named: foodtemp.img)
        nameLbl.text = foodtemp.name
        kcalLbl.text = foodtemp.kcal
        plgLbl.text = foodtemp.plg
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
