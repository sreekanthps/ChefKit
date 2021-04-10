//
//  CartViewController.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import UIKit

class CartViewController: UIViewController {
    private var mainView: CartView {
        return self.view as! CartView
    }
    
    private var payButton: UIButton {
        let button = UIButton(frame: .zero)
        button.setBackgroundImage(UIImage(named: "close"), for: .normal)
        button.frame = CGRect(x: screenWidth - 80, y: screenHeight - 100, width: 50.0, height: 50.0)
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 1
        
        return button
    }
    init(){
            super.init(nibName: nil, bundle: Bundle.main)
           }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func viewDidLoad() {
          super.viewDidLoad()
          self.view.addSubview(payButton)
         
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
            let view = CartView(cartData: retunCartList(),menuDataModel: retunCartMenuModel())
            //let view = DashBoardTableView(dataModel: returnTableMenu())
            self.view = view
        }
}
