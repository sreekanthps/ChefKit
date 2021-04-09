//
//  DashBoardTableView.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit

class DashBoardTableView: UIView {
    fileprivate var modelData: [MenuItemsModel]?
    private let rootView: UIView = {
         let uiview = UIView()
           uiview.backgroundColor = UIColor.hexColor(Colors.backGround)
         return uiview
       }()
       var tableView = UITableView()
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
       
       init() {
           super.init(frame: .zero)
           configure()
           layout()
       }
       
    convenience init(dataModel:  [MenuItemsModel]?) {
        self.init()
        self.modelData = dataModel
    }
       
       private func configure() {
           tableView.tableFooterView = UIView()
           tableView.backgroundColor = UIColor.hexColor(Colors.backGround)
           tableView.delegate = self
           tableView.dataSource = self
           tableView.separatorStyle = .none
           tableView.register(MenuItemCell.self, forCellReuseIdentifier: MenuItemCell.reuseIdentifier)
           tableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.reuseIdentifier)
           tableView.estimatedRowHeight = 120
           tableView.showsVerticalScrollIndicator = false
           
       }
       
       func layout() {
           removeAllSubviewsAndRemoveFromSuperview()
           rootView.flex.define { (flex) in
            flex.addItem(tableView).marginHorizontal(15).marginTop(30).marginBottom(10)
               
           }
           addSubview(rootView)
       }
       
       
       override func layoutSubviews() {
           super.layoutSubviews()
           rootView.pin.all()
           rootView.flex.layout()
       }
}

extension DashBoardTableView: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  modelData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.reuseIdentifier, for: indexPath) as? CartItemCell,
            let model = modelData?[indexPath.row]{
            cell.configureData(data: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delegate?.didSelectRowAt(indexPath: indexPath)
    }
    
    
    
}
