//
//  ButtonMenuCell.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import FlexLayout
import PinLayout
import UIKit

class ButtonMenuCell: UITableViewCell {
    static let reuseIdentifier = "ButtonMenuCell"
    fileprivate var menuItems: [MenuModel]? = []
    fileprivate var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
     
        //layout.minimumLineSpacing = 5
        //layout.minimumInteritemSpacing = 5
        //layout.sectionInset = UIEdgeInsets(top: 16, left: 5, bottom: 16, right: 5)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.hexColor(Colors.bc5)
        label.text = "FILTERS"
        return label
    }()
    fileprivate let spicy : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitle("SPICY", for: .normal)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    fileprivate let vegan : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitle("VEGAN", for: .normal)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DashBoardMenuCell.self, forCellWithReuseIdentifier: DashBoardMenuCell.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        layoutViews()
    }
    
    func layoutViews() {
        self.contentView.flex.define { (flex) in
                flex.addItem(collectionView).width(100%).height(100)
                flex.addItem().width(100%).height(20).direction(.row).define { (flex) in
                    flex.addItem(label).width(60).height(20)
                    flex.addItem(spicy).width(60).height(20).marginLeft(5)
                    flex.addItem(vegan).width(60).height(20).marginLeft(10)
                }
              
         }
    }
    
   func configureData(data: [MenuModel]?) {
       menuItems = data
       collectionView.reloadData()
       vegan.setTitle("VEGAN", for: .normal)
       spicy.setTitle("SPICY", for: .normal)
        setNeedsLayout()
   }
    
   override func layoutSubviews() {
       super.layoutSubviews()
       layout()
   }
   func layout() {
       contentView.flex.layout(mode: .adjustHeight)
   }
   
   required init?(coder aDecoder: NSCoder) {
       //fatalError("init(coder:) has not been implemented")
       return nil
   }
   
   override func sizeThatFits(_ size: CGSize) -> CGSize {
       // 1) Set the contentView's width to the specified size parameter
       contentView.pin.width(size.width)
       
       // 2) Layout contentView flex container
       layout()
       
       // Return the flex container new size
       return contentView.frame.size
   }
}

extension ButtonMenuCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let items = menuItems else {
            return 0
        }
        return items.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashBoardMenuCell.reuseIdentifier, for: indexPath) as! DashBoardMenuCell
        guard let modelData = self.menuItems?[indexPath.row] else { return UICollectionViewCell() }
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
