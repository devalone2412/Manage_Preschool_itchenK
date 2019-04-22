//
//  FoodService.swift
//  Manage_Preschool_itchenK
//
//  Created by Luc Thoi Sang on 4/21/19.
//  Copyright © 2019 Luc Thoi Sang. All rights reserved.
//

import Foundation

class FoodService {
    static let instance = FoodService()
    
    func getDataFromServer() -> [Food]{
        var arrayFood = [Food]()
        let food = Food(imageFood: "egg", nameFood: "Món trứng hột vịt lộn")
        for _ in 0...9 {
            arrayFood.append(food)
        }
        return arrayFood
    }
}
