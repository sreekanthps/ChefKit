//
//  DashBoardController.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit

class DashBoardController: UIViewController {
//    private var mainView: DashBoardView {
//        return self.view as! DashBoardView
//    }
//    private var mainView: DashboardMenuView {
//        return self.view as! DashboardMenuView
//    }
    private var mainView: DashBoardTableView {
            return self.view as! DashBoardTableView
        }
    
    init(){
            super.init(nibName: nil, bundle: Bundle.main)
           }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func viewDidLoad() {
          super.viewDidLoad()
         
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        func navigateToDashBoard() {
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (nil) in
    //             let newVC = AWSLoginController()
    //            self.navigationController?.pushViewController(newVC, animated: false)
            }
           
        }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
        }
        
        override func loadView() {
            //let view = DashBoardView(data: retunDataModel())
            //let view = DashboardMenuView(data: retunMenuModel())
            let view = DashBoardTableView(dataModel: returnTableMenu())
            self.view = view
        }
        
    func retunDataModel() -> [PromotionModel] {
        return [PromotionModel(smallHeader: "Checf Kit", bigHeader: "Tuesday Discount", desciptionText: "Every Tuesday there is a free drinks to order"),
        PromotionModel(smallHeader: "Checf Kit", bigHeader: "Monday Discount", desciptionText: "Every Tuesday there is a free drinks to order"),PromotionModel(smallHeader: "Checf Kit", bigHeader: "Sunday Discount", desciptionText: "Every Tuesday there is a free drinks to order")]
    }
    func retunMenuModel() -> [MenuModel] {
        return [MenuModel(menuItem: "Pizza and other itmes"),MenuModel(menuItem: "Burger"),MenuModel(menuItem: "Chinese"),MenuModel(menuItem: "Mexican"),MenuModel(menuItem: "Pasta"),MenuModel(menuItem: "Pizza and other itmes"),MenuModel(menuItem: "Burger"),MenuModel(menuItem: "Chinese"),MenuModel(menuItem: "Mexican"),MenuModel(menuItem: "Pasta"),MenuModel(menuItem: "Pizza and other itmes"),MenuModel(menuItem: "Burger"),MenuModel(menuItem: "Chinese"),MenuModel(menuItem: "Mexican"),MenuModel(menuItem: "Pasta")]
    }
    func returnTableMenu()-> [MenuItemsModel] {
        return[MenuItemsModel(image: "pizza", title: "Large Cheese Pizza", description: "A large mac and cheese pizza for all menus", contents: "190 grms, 40 cms" , price: "55 USD"),
        MenuItemsModel(image: "pizzabig", title: "Peprono  Pizza", description: "A peprono piza with mac and cheese  for all menus", contents: "100 grms, 35cms" , price: "40 USD"),MenuItemsModel(image: "pizzacut", title: "Deluxe", description: "Chicken ham peproni tomata sauce", contents: "150 grms, 35cms" , price: "46 USD"),MenuItemsModel(image: "pizza", title: "Large Cheese Pizza", description: "A large mac and cheese pizza for all menus", contents: "190 grms, 40 cms" , price: "55 USD"),
        MenuItemsModel(image: "pizzabig", title: "Peprono  Pizza", description: "A peprono piza with mac and cheese  for all menus", contents: "100 grms, 35cms" , price: "40 USD"),MenuItemsModel(image: "pizzacut", title: "Deluxe", description: "Chicken ham peproni tomata sauce", contents: "150 grms, 35cms" , price: "46 USD"),MenuItemsModel(image: "pizza", title: "Large Cheese Pizza", description: "A large mac and cheese pizza for all menus", contents: "190 grms, 40 cms" , price: "55 USD"),
        MenuItemsModel(image: "pizzabig", title: "Peprono  Pizza", description: "A peprono piza with mac and cheese  for all menus", contents: "100 grms, 35cms" , price: "40 USD"),MenuItemsModel(image: "pizzacut", title: "Deluxe", description: "Chicken ham peproni tomata sauce", contents: "150 grms, 35cms" , price: "46 USD")]
    }
        
}
