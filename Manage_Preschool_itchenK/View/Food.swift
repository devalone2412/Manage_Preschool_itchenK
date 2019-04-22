//
//  Food.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/21/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import Foundation

class Food {
    private(set) public var imageFood: String!
    private(set) public var nameFood: String!
    
    init(imageFood: String, nameFood: String) {
        self.imageFood = imageFood
        self.nameFood = nameFood
    }
}
