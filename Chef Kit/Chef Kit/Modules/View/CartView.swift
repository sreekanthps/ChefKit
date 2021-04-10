//
//  CartView.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import UIKit
class CartView: UIView {
    fileprivate var cartData: CartItemsModel?
    let tableHeight =  screenHeight - 250
    private let rootView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = UIColor.hexColor(Colors.backGround)
        return uiview
    }()
    var menuData: [MenuModel]?
    fileprivate let delivery: UILabel = {
       let label = UILabel(frame: .zero)
       label.numberOfLines = 2
       label.textAlignment = .left
       label.text = "Delivery is Free"
       label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
       label.textColor = UIColor.hexColor(Colors.bc3)
       return label
   }()
    fileprivate let costLabel: UILabel = {
       let label = UILabel(frame: .zero)
       label.numberOfLines = 2
       label.textAlignment = .left
       label.text = "Value:"
       label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
       label.textColor = UIColor.hexColor(Colors.bc3)
       return label
   }()
    fileprivate let cost: UILabel = {
       let label = UILabel(frame: .zero)
       label.numberOfLines = 2
       label.textAlignment = .left
       label.text = "161 USD"
       label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
       label.textColor = UIColor.hexColor(Colors.bc3)
       return label
   }()
    
    
    fileprivate var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 5, bottom: 16, right: 5)
       let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collection
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
    
    convenience init(cartData:  CartItemsModel?, menuDataModel: [MenuModel]?) {
        self.init()
        self.cartData = cartData
        self.menuData = menuDataModel
    }
    
    private func configure() {
        configureTableView()
        configureCollectionView()
    }
    private func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.hexColor(Colors.backGround)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ButtonOptionsCell.self, forCellReuseIdentifier: ButtonOptionsCell.reuseIdentifier)
        tableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.reuseIdentifier)
        tableView.estimatedRowHeight = 120
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func configureCollectionView() {
        collectionView.register(DashBoardMenuCell.self, forCellWithReuseIdentifier: DashBoardMenuCell.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func layout() {
        removeAllSubviewsAndRemoveFromSuperview()
        rootView.flex.define { (flex) in
            flex.addItem(collectionView).marginHorizontal(15).marginTop(10).height(100)
            flex.addItem(tableView).marginHorizontal(15).marginTop(10).marginBottom(10).height(tableHeight)
            flex.addItem(delivery).marginTop(10).marginHorizontal(15)
            flex.addItem().marginHorizontal(15).direction(.row).marginTop(10).define { (flex) in
                flex.addItem(costLabel)
                flex.addItem(cost).marginLeft(15)
            }
       }
        addSubview(rootView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootView.pin.all()
        rootView.flex.layout()
    }
}

extension CartView: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = cartData?.orders  else {
            return 0
        }
        return  data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.reuseIdentifier, for: indexPath) as? CartItemCell,
                  let data = cartData?.orders else {
                return UITableViewCell()
            }
            let model = data[indexPath.row]
            cell.configureData(data: model)
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delegate?.didSelectRowAt(indexPath: indexPath)
    }
    
}

extension CartView: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.menuData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashBoardMenuCell.reuseIdentifier, for: indexPath) as! DashBoardMenuCell
        guard let modelData = self.menuData?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(model: modelData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100,height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt : \(indexPath.item)")
    }
}
