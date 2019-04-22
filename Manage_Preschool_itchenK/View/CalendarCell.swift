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
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    var cs: CookingScheduleVC?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
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
        return CGSize(width: frame.height - 20, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 22, bottom: 10, right: 22)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cs?.showDetailsFood()
    }
    
}
