//
//  FoodCell.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit


class FoodCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    let imageName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: FONT, size: 13)
        lb.numberOfLines = 0
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    func setupView() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(imageView)
        addSubview(imageName)
        imageName.textAlignment = .center
    }
    
    func setConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        imageName.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(5)
            
        }
    }
    
    func configFoodCell(image: String, name: String) {
        imageView.image = UIImage(named: image)
        imageName.text = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
