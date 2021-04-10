//
//  DashBoardCollectionController.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import UIKit

class DashBoardCollectionController: UIViewController {
    
    private var mainView: DashBoardCollectionView {
        return self.view as! DashBoardCollectionView
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
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
        }
        
        override func loadView() {
            //let view = DashBoardView(data: retunDataModel())
            let view = DashBoardCollectionView(dataModel: retunMenuModel())
            //let view = DashBoardTableView(dataModel: returnTableMenu())
            self.view = view
        }
}

