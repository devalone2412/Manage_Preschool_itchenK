//
//  IMCell.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/24/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
class IMCell: UITableViewCell {

    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        //        v.layer.masksToBounds = true
        v.layer.shadowOffset = CGSize(width: -1, height: 1)
        v.layer.shadowOpacity = 0.5
        v.layer.shadowColor = UIColor.black.cgColor
        //        v.layer.borderWidth = 2
        return v
    }()
    
    let imgFood: UIImageView = {
        let iv = UIImageView()
        //        iv.contentMode = .scaleAspectFit
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
    
    let cellIMId = "cellTable"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellIMId)
        
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
            make.left.equalTo(bgView).inset(5)
            make.centerY.equalTo(bgView)
            make.width.height.equalTo(bgView.snp.height).multipliedBy(0.7)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.right.equalTo(bgView).inset(10)
            make.height.equalTo(bgView.snp.height).multipliedBy(0.7)
            make.centerY.equalTo(bgView)
            make.left.equalTo(imgFood.snp.right).offset(10)
        }
    }
    
    func configFoodDetails(ingretemp: IngreTemp) {
        imgFood.image = UIImage(named: ingretemp.img)
        nameLbl.text = ingretemp.name
        kcalLbl.text = ingretemp.kcal
        plgLbl.text = ingretemp.plg
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
