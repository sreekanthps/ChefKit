//
//  MockData.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation


func retunDataModel() -> [PromotionModel] {
    return [PromotionModel(smallHeader: "Checf Kit", bigHeader: "Tuesday Discount", desciptionText: "Every Tuesday there is a free drinks to order"),
    PromotionModel(smallHeader: "Checf Kit", bigHeader: "Monday Discount", desciptionText: "Every Tuesday there is a free drinks to order"),PromotionModel(smallHeader: "Checf Kit", bigHeader: "Sunday Discount", desciptionText: "Every Tuesday there is a free drinks to order")]
}
func retunMenuModel() -> [MenuModel] {
    return [MenuModel(menuItem: "Pizza"),MenuModel(menuItem: "Burger"),MenuModel(menuItem: "Chinese"),MenuModel(menuItem: "Mexican"),MenuModel(menuItem: "Pasta"),MenuModel(menuItem: "Pizza and other itmes"),MenuModel(menuItem: "Burger"),MenuModel(menuItem: "Chinese"),MenuModel(menuItem: "Mexican"),MenuModel(menuItem: "Pasta"),MenuModel(menuItem: "Pizza and other itmes"),MenuModel(menuItem: "Burger"),MenuModel(menuItem: "Chinese"),MenuModel(menuItem: "Mexican"),MenuModel(menuItem: "Pasta")]
}
func returnTableMenu()-> [MenuItemsModel] {
    return[MenuItemsModel(image: "pizza", title: "Large Cheese Pizza", description: "A large mac and cheese pizza for all menus", contents: "190 grms, 40 cms" , price: "55 USD"),
    MenuItemsModel(image: "pizzabig", title: "Peprono  Pizza", description: "A peprono piza with mac and cheese  for all menus", contents: "100 grms, 35cms" , price: "40 USD"),MenuItemsModel(image: "pizzacut", title: "Deluxe", description: "Chicken ham peproni tomata sauce", contents: "150 grms, 35cms" , price: "46 USD"),MenuItemsModel(image: "pizza", title: "Large Cheese Pizza", description: "A large mac and cheese pizza for all menus", contents: "190 grms, 40 cms" , price: "55 USD"),
    MenuItemsModel(image: "pizzabig", title: "Peprono  Pizza", description: "A peprono piza with mac and cheese  for all menus", contents: "100 grms, 35cms" , price: "40 USD"),MenuItemsModel(image: "pizzacut", title: "Deluxe", description: "Chicken ham peproni tomata sauce", contents: "150 grms, 35cms" , price: "46 USD"),MenuItemsModel(image: "pizza", title: "Large Cheese Pizza", description: "A large mac and cheese pizza for all menus", contents: "190 grms, 40 cms" , price: "55 USD"),
    MenuItemsModel(image: "pizzabig", title: "Peprono  Pizza", description: "A peprono piza with mac and cheese  for all menus", contents: "100 grms, 35cms" , price: "40 USD"),MenuItemsModel(image: "pizzacut", title: "Deluxe", description: "Chicken ham peproni tomata sauce", contents: "150 grms, 35cms" , price: "46 USD")]
}
func retunCartMenuModel() -> [MenuModel] {
    return [MenuModel(menuItem: "Cart"),MenuModel(menuItem: "Orders"),MenuModel(menuItem: "Information"),MenuModel(menuItem: "Settings")]
}
func retunCartList() ->CartItemsModel? {
    //return CartItemsModel(items: [CartModel(name: "Hawaiian", quantity: 1, stringCost: "46 USD"),CartModel(name: "Pepperoni", quantity: 1, stringCost: "55 USD"),CartModel(name: "California", quantity: 1, stringCost: "55 USD")], stringCost: "161 USD")
    return CartItemsModel(orders: [CartModel(name: "Hawaiian", image: "pizzabig", quantity: 1, stringCost: "46 USD"),CartModel(name: "Pepperoni", image: "pizza", quantity: 1, stringCost: "55 USD"),CartModel(name: "California", image: "pizza", quantity: 1, stringCost: "60 USD")], stringCost: "161 USD")
}
