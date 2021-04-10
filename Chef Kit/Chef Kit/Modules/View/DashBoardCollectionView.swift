//
//  DashBoardCollectionView.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout

class DashBoardCollectionView: UIView {
    fileprivate var menuModel: [MenuModel]?
    private let rootView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor =  .yellow//UIColor.hexColor(Colors.backGround)
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
       
    convenience init(dataModel:  [MenuModel]?) {
        self.init()
        menuModel = dataModel
        
    }
    private func configure() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.hexColor(Colors.backGround)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ButtonMenuCell.self, forCellReuseIdentifier: ButtonMenuCell.reuseIdentifier)
        tableView.estimatedRowHeight = 120
        tableView.showsVerticalScrollIndicator = false
        
    }
    
    func layout() {
        removeAllSubviewsAndRemoveFromSuperview()
        rootView.flex.define { (flex) in
            flex.addItem(tableView).marginHorizontal(10).height(100%)
            
        }
        addSubview(rootView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootView.pin.all()
        rootView.flex.layout()
    }
    
    
}


extension DashBoardCollectionView: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ButtonMenuCell.reuseIdentifier, for: indexPath) as? ButtonMenuCell {
            cell.configureData(data: retunMenuModel())
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delegate?.didSelectRowAt(indexPath: indexPath)
    }
    
    
    
}
