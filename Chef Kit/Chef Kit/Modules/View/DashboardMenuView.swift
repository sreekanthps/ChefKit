//
//  DashboardMenuView.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout


class DashboardMenuView: UIView {
    fileprivate let root: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    fileprivate let curvedView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        //view.layer.cornerRadius = 25
        //view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //view.roundCorners(corners: [.topLeft, .topRight])
        let path = UIBezierPath(roundedRect:view.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.frame = view.frame
        return view
    }()
    fileprivate var collectionView: UICollectionView
    fileprivate let flowLayout = UICollectionViewFlowLayout()
    var modelData: [MenuModel]?
    init() {
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 5, bottom: 16, right: 5)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(frame: .zero)
       
        collectionView.register(DashBoardMenuCell.self, forCellWithReuseIdentifier: DashBoardMenuCell.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
       
        loadView()
    }
    func loadView() {
        removeAllSubviewsAndRemoveFromSuperview()
        root.flex.define { (flex) in
            flex.addItem(curvedView).marginTop(100).width(100%).height(100).define { (flex) in
                flex.addItem(collectionView).width(100%).height(80).marginTop(20)
            }
           
        }
        addSubview(root)
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        root.pin.all()
        
        // Then let the flexbox container layout itself
        root.flex.layout()
    }
    
    convenience init(data: [MenuModel]?) {
        self.init()
        self.modelData = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DashboardMenuView: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.modelData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashBoardMenuCell.reuseIdentifier, for: indexPath) as! DashBoardMenuCell
        guard let modelData = self.modelData?[indexPath.row] else { return UICollectionViewCell() }
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
