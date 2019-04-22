//
//  FoodListVC.swift
//  Manage_Preschool_itchenK
//
//  Created by Vinh Trần on 4/22/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
class FoodListVC: UIViewController {

    let imgBackground = UIImageView()
    let categoryName = UIView()
    let categoryImage = UIImageView()
    let categoryLabel = UILabel()
    
    let FLTableView = UITableView()
    
    let cellTableId = "cellTable"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        FLTableView.dataSource = self
        FLTableView.delegate = self
        view.addSubview(FLTableView)
        FLTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellTableId)
        setupViewTable()
    }
    
    func setupViewTable(){
        FLTableView.backgroundColor = UIColor.black
        
        FLTableView.snp.makeConstraints { (make) in
            make.top.equalTo(categoryName.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }

}
extension FoodListVC: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellTableId)
        cell.backgroundColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit"){(action, view, handler) in
            print("Edit Action Tapped")
        }
        edit.backgroundColor = UIColor.flatSkyBlue()
        edit.image = UIImage(named: "icons8-edit")
        let delete = UIContextualAction(style: .normal, title: "Delete"){(action, view, handler) in
            print("Delete Action Tapped")
        }
        delete.backgroundColor = UIColor.flatRed()
        delete.image = UIImage(named: "icons8-trash")
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
}
class UIFLCell: UITableViewCell {

    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let blank = UIView()

    func setupView(){
//        addSubview(cellImage)
//        addSubview(textTable)
        addSubview(blank)
        blank.backgroundColor = UIColor.black
        blank.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(10)
            make.height.equalTo(10)
        }

//        cellImage.snp.makeConstraints { (make) in
//            make.left.right.top.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.8)
//        }
//
//        textTable.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.2)
//        }
    }
}
