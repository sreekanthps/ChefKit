//
//  DashBoardController.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit

class DashBoardController: UIViewController {
    private var mainView: DashBoardView {
        return self.view as! DashBoardView
    }
//    private var mainView: DashboardMenuView {
//        return self.view as! DashboardMenuView
//    }
//    private var mainView: DashBoardTableView {
//            return self.view as! DashBoardTableView
//        }
    
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
            let view = DashBoardView(data: retunDataModel())
            //let view = DashboardMenuView(data: retunMenuModel())
            //let view = DashBoardTableView(dataModel: returnTableMenu())
            self.view = view
        }
        
    
        
}
