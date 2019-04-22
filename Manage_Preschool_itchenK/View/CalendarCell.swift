//
//  CalendarCell.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/21/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    let foodCellId = "foodCellId"
    let arrayFood = FoodService.instance.getDataFromServer()
    let foodCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        backgroundColor = .blue
        addSubview(foodCollectionView)
        foodCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(FoodCell.self, forCellWithReuseIdentifier: foodCellId)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CalendarCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: foodCellId, for: indexPath) as! FoodCell
        cell.configFoodCell(image: arrayFood[indexPath.item].imageFood, name: arrayFood[indexPath.item].nameFood)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - 44 - 20) / 3, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 22, bottom: 10, right: 22)
    }
    
    private class FoodCell: UICollectionViewCell {
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleToFill
            iv.layer.cornerRadius = 5
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
            backgroundColor = .red
            layer.cornerRadius = 5
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
    
}
