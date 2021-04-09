//
//  CartItemCell.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout


class CartItemCell: UITableViewCell {
    
    static let reuseIdentifier = "CartItemCell"
    let lblWidth  =  (screenWidth - 140) / 2
    let imgView: UIImageView = {
         let imgView = UIImageView(frame: .zero)
         imgView.contentMode = .scaleAspectFit
         imgView.image = UIImage(named: "photography")
         return imgView
     }()
    var itemDesc: UILabel = {
       let label = UILabel(frame: .zero)
       label.numberOfLines = 2
       label.textAlignment = .left
       label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
       label.textColor = UIColor.hexColor(Colors.bc3)
       return label
   }()
    
    let itemPrice: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.hexColor(Colors.bc5)
        return label
    }()
    
    private var delete: UIButton {
        let button = UIButton(frame: .zero)
        button.setBackgroundImage(UIImage(named: "close"), for: .normal)
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 1
        
        return button
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    func layoutViews() {
        self.contentView.flex.define { (flex) in
            flex.addItem().marginHorizontal(20).direction(.row).marginVertical(10).justifyContent(.center).define { (flex) in
               flex.addItem(imgView).size(70)
                flex.addItem(itemPrice).marginLeft(5).width(lblWidth)
                flex.addItem(itemDesc).width(lblWidth).marginRight(5)
                flex.addItem(delete).width(20).height(20)
           }
         }
    }
    
    func configureData(data: MenuItemsModel) {
        imgView.image = UIImage(named: data.image ?? "pizza")
        itemDesc.text = data.description
        itemPrice.text = data.description
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
