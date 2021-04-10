//
//  PromotionModel.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import Foundation

struct PromotionModel {
    let smallHeader: String?
    let bigHeader: String?
    let desciptionText: String?
}

struct MenuItemsModel {
    let image: String?
    let title: String?
    let description: String?
    let contents: String?
    let price: String?
}

struct MenuModel {
    let menuItem: String?
}

struct CartItemsModel {
    let totaCost: Int? = 0
    let deliveryCost: Int? = 0
    let orders: [CartModel]?
    let stringCost: String?
}

struct CartModel {
    let name: String?
    let image: String?
    let quantity: Int?
    let cost: Int? = 0
    let stringCost: String?
   
}
