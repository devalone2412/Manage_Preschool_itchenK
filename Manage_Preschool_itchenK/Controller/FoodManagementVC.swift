//
//  FoodManagementVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/16/19.
//  Copyright © 2019 Vinh Trần. All rights reserved.
//

import UIKit
import SnapKit

class FoodManagementVC: UIViewController {
    
    let imgBackground = UIImageView()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    let blurView = UIVisualEffectView()
    let categoryLabel = UILabel()
    
    let FMCollectionView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        collection.backgroundColor=UIColor.black
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()
    
    let cellIdentifier="itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        //eventHandler()
        FMCollectionView.dataSource = self
        FMCollectionView.delegate = self
        view.addSubview(FMCollectionView)
        FMCollectionView.register(UIFMCell.self, forCellWithReuseIdentifier: cellIdentifier)
        setupCollection()
    }
    func setupCollection(){
        
        FMCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        FMCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        FMCollectionView.heightAnchor.constraint(equalToConstant: 467  ).isActive = true
        FMCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
    
    //    func eventHandler() {
    //        print("456")
    //    }
    
}

extension FoodManagementVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! UIFMCell
        customCell.backgroundColor  = .white
        customCell.layer.cornerRadius = 20
        customCell.layer.shadowOpacity = 3
        customCell.layer.masksToBounds = true
        customCell.cellImage.image = UIImage(named: "BitmapCơm")
        
        return customCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 25, bottom: 35, right: 25)
    }
    
}

class UIFMCell: UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Cơm"
        return label
    }()
    
    func setupView(){
        addSubview(cellImage)
        addSubview(textLabel)
        
        cellImage.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }
}

    
